from django.shortcuts import render
from .models import User, Submission, FactorSubmission, ChallengeTag, FactorTag, SubmissionSnapshot, FinalQuestions
from django.views import generic
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse

import parse
import random
import re
from random_username.generate import generate_username

import smtplib, ssl

import gspread
from oauth2client.service_account import ServiceAccountCredentials
import pprint

def login_or_new(request):
    challenge_names = ["H_Index", "Contains_Substring", "Contains_Loop"]
    if ChallengeTag.objects.count() == 0:
        challenges = [ChallengeTag(tag=name) for name in challenge_names]
        for challenge in challenges:
            challenge.save()

    num_factors = [2, 4, 4]
    for i in range(len(num_factors)):
        for j in range(num_factors[i]):
            factor_name = f"Factor_{j+1}"
            challenge = ChallengeTag.objects.filter(tag__exact=challenge_names[i])[0]
            if FactorTag.objects.filter(tag__exact=factor_name).filter(challenge_tag__exact=challenge).count() == 0:
                
                factor = FactorTag(tag=factor_name, challenge_tag=challenge)
                factor.save()
            
        
        
    return render(request, 'login_or_new.html')

@csrf_exempt
def submit_challenge(request, origin_type: str, origin_name: str, two_pages_back: str, username: str):
    username = request.POST['username']
    answer1 = request.POST['answer1']
    answer2 = request.POST['answer2']

    user_email = request.POST['user_email']
    
    user = User.objects.filter(char_name__exact=username)[0]
    submission = Submission.objects.filter(user__exact=user)[0]

    final_questions = FinalQuestions(submission=submission, answers1=answer1,
                                     answers2=answer2)
    final_questions.save()


    spreadsheet_row = ["" for i in range(18)]

    #Insert username
    spreadsheet_row[0] = str(user.char_name)
    #sheet.update_cell(row, 1, str(user.char_name))
    
    factor_submissions = FactorSubmission.objects.filter(submission__exact=submission)
    
    challenge_tag1 = ChallengeTag.objects.filter(tag__exact="H_Index")[0]
    submission1 = factor_submissions.filter(challenge_tag__exact=challenge_tag1)[0]

    #Insert group for Q1
    spreadsheet_row[1] = str(submission1.factor_tag.tag)
    #sheet.update_cell(row, 2, str(submission1.factor_tag.tag))
    
    #Insert response for Q1
    spreadsheet_row[2] = str(submission1.response1)
    #sheet.update_cell(row, 3, str(submission1.response1))
    
    #Insert time for Q1
    spreadsheet_row[4] = str(submission1.time)
    #sheet.update_cell(row, 5, str(submission1.time))
    
    challenge_tag2 = ChallengeTag.objects.filter(tag__exact="Contains_Substring")[0]
    submission2 = factor_submissions.filter(challenge_tag__exact=challenge_tag2)[0]

    #Insert group for Q2
    spreadsheet_row[5] = str(submission2.factor_tag.tag)
    #sheet.update_cell(row, 6, str(submission2.factor_tag.tag))
    
    #Insert response for Q2, field 1
    spreadsheet_row[6] = str(submission2.response1)
    #sheet.update_cell(row, 7, str(submission2.response1))
    
    #Insert response for Q2, field 2
    spreadsheet_row[7] = str(submission2.response2)
    #sheet.update_cell(row, 8, str(submission2.response2))
    
    #Insert time for Q2
    spreadsheet_row[10] = str(submission2.time)
    #sheet.update_cell(row, 11, str(submission2.time))
    
    challenge_tag3 = ChallengeTag.objects.filter(tag__exact="Contains_Loop")[0]
    submission3 = factor_submissions.filter(challenge_tag__exact=challenge_tag3)[0]

    #Insert group for Q3
    spreadsheet_row[11] = str(submission3.factor_tag.tag)
    #sheet.update_cell(row, 12, str(submission3.factor_tag.tag))
    
    #Insert response for Q3
    spreadsheet_row[12] = str(submission3.response1)
    #sheet.update_cell(row, 13, str(submission3.response1))
    
    #Insert time for Q3
    spreadsheet_row[14] = str(submission3.time)
    #sheet.update_cell(row, 15, str(submission3.time))
    
    
    snapshots = SubmissionSnapshot.objects.filter(user__exact=user)
    snapshots1 = snapshots.filter(challenge_tag__exact=challenge_tag1)
    snapshots2 = snapshots.filter(challenge_tag__exact=challenge_tag2)
    snapshots3 = snapshots.filter(challenge_tag__exact=challenge_tag3)

    #Insert snapshops for Q1
    snapshots1_text = ""
    for snapshot1 in snapshots1:
        addition = f"seconds:\n{str(snapshot1.time)}\nsnapshot:\n{str(snapshot1.input_snapshot)}\n"
        if len(snapshots1_text) == 0:
            snapshots1_text = addition
        else:
            snapshots1_text = f"{snapshots1_text}---\n{addition}"
    spreadsheet_row[3] = snapshots1_text
    #sheet.update_cell(row, 4, snapshots1_text)

    #Insert snapshots for Q2
    snapshots2_box1_text = ""
    snapshots2_box2_text = ""
    for snapshot2 in snapshots2:
        addition = f"seconds:\n{str(snapshot2.time)}\nsnapshot:\n{str(snapshot2.input_snapshot)}\n"
        if str(snapshot2.box) == "1":
            if len(snapshots2_box1_text) == 0:
                snapshots2_box1_text = addition
            else:
                snapshots2_box1_text = f"{snapshots2_box1_text}---\n{addition}"
        else:
            if len(snapshots2_box2_text) == 0:
                snapshots2_box2_text = addition
            else:
                snapshots2_box2_text = f"{snapshots2_box2_text}---\n{addition}"
    spreadsheet_row[8] = snapshots2_box1_text
    #sheet.update_cell(row, 9, snapshots2_box1_text)
    spreadsheet_row[9] = snapshots2_box2_text
    #sheet.update_cell(row, 10, snapshots2_box2_text)

    #Insert snapshops for Q3
    snapshots3_text = ""
    for snapshot3 in snapshots3:
        addition = f"seconds:\n{str(snapshot3.time)}\nsnapshot:\n{str(snapshot3.input_snapshot)}\n"
        if len(snapshots3_text) == 0:
            snapshots3_text = addition
        else:
            snapshots3_text = f"{snapshots3_text}---\n{addition}"
    spreadsheet_row[3] = snapshots3_text
    #sheet.update_cell(row, 4, snapshots3_text)

    #Insert survey Q1 response
    spreadsheet_row[15] = answer1
    #sheet.update_cell(row, 16, answer1)
    
    #Insert survey Q2 response
    spreadsheet_row[16] = answer2
    #sheet.update_cell(row, 17, answer2)
    
    #Insert survey Q3 response
    spreadsheet_row[17] = user_email
    #sheet.update_cell(row, 18, user_email)
    
    #Authorize the API
    scope = [
        'https://www.googleapis.com/auth/drive',
        'https://www.googleapis.com/auth/drive.file'
    ]
    file_name = 'client_key.json'
    creds = ServiceAccountCredentials.from_json_keyfile_name(file_name,scope)
    client = gspread.authorize(creds)

    sheet = client.open('APC Comprehension Study Results').get_worksheet(0)
    #num_submissions = int(sheet.cell(1, 2).value)
    #Update submission count
    #sheet.update_cell(1, 2, str(num_submissions+1))
    #row = num_submissions + 3

    sheet.append_row(spreadsheet_row)
    
    def dont_do():
        #start send email
        port = 465
        password = "POISErt91"
        context = ssl.create_default_context()
        destination = "dae1@williams.edu"
        sender = "mudd.code.challenge@gmail.com"
        
        with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
            server.login(sender, password)
            message = f"Subject: code challenge submission\n\nemail: {user_email}"

            print(f"Message: {message}")
            server.sendmail(sender, destination, message)
            #end send email
        
    return HttpResponse()

def select_challenge_page(request, origin_type: str, origin_name: str, two_pages_back: str, username: str):    
    
    intro_pages = 'intro{:d}.html'
    num_intro_pages = 4

    h_index_pages = 'h_index{:d}.html'
    num_h_index_pages = 2

    contains_substring_pages = 'contains_substring{:d}.html'
    num_contains_substring_pages = 4

    contains_loop_pages = 'contains_loop{:d}.html'
    num_contains_loop_pages = 4

    rest_page = 'rest_page.html'
    rest_redirect = {intro_pages: h_index_pages, h_index_pages: contains_substring_pages, contains_substring_pages: contains_loop_pages}
    challenge_page_numbers = {h_index_pages: num_h_index_pages, contains_substring_pages: num_contains_substring_pages, contains_loop_pages: num_contains_loop_pages}
    
    page_to_render = None
    context = {'previous_page': origin_name, 'username': username}
    
    if origin_type == "intro":
        last_index = parse.parse(intro_pages, origin_name)[0]
        if last_index == num_intro_pages:
            page_to_render = rest_page
        else:
            next_index = last_index + 1
            page_to_render = intro_pages.replace("{:d}", str(next_index))
        
    elif origin_type == "rest":
        two_pages_back_generic = re.sub(r"(.*)[0-9]+(.*)",
                                        r"\1{:d}\2",
                                        two_pages_back)
        page_to_render_generic = rest_redirect[two_pages_back_generic]
        max_index_to_render = challenge_page_numbers[page_to_render_generic]
        index_to_render = random.randint(1, max_index_to_render)
        context['factor'] = str(index_to_render)
        page_to_render = page_to_render_generic.replace("{:d}", str(index_to_render))

    elif origin_type == "challenge":
        if "loop" not in origin_name:
            page_to_render = rest_page
        else:
            page_to_render = "final_questions.html"

    else:
        page_to_render = intro_pages.replace("{:d}", str(1))

    return render(request, page_to_render, context)

@csrf_exempt
def submit_challenge1(request, origin_type, origin_name, two_pages_back, username):
    username = request.POST['username']
    factor = request.POST['factor']
    time = request.POST['time']
    responses = request.POST['responses']

    user = User.objects.filter(char_name__exact=username)[0]
    submission = Submission(which_submission=1, user=user)
    submission.save()
    print(f"Saved user = {user} ?with username = {username}? into submission = {submission}")

    challenge_tag = ChallengeTag.objects.filter(tag__exact="H_Index")[0]
    factor_tag_name = f"Factor_{factor}"
    factor_tag = FactorTag.objects.filter(challenge_tag__exact=challenge_tag).filter(tag__exact=factor_tag_name)[0]

    submission = Submission.objects.filter(user__exact=user)[0]
    factor_submission = FactorSubmission(submission=submission, challenge_tag=challenge_tag, factor_tag=factor_tag, time=time, response1=responses, response2="none")
    factor_submission.save()
    
    return HttpResponse()

@csrf_exempt
def submit_challenge2(request, origin_type, origin_name, two_pages_back, username):
    username = request.POST['username']
    factor = request.POST['factor']
    time = request.POST['time']
    responses1 = request.POST['responses1']
    responses2 = request.POST['responses2']

    user = User.objects.filter(char_name__exact=username)[0]
    submission = Submission.objects.filter(user__exact=user)[0]

    challenge_tag = ChallengeTag.objects.filter(tag__exact="Contains_Substring")[0]
    factor_tag_name = f"Factor_{factor}"
    factor_tag = FactorTag.objects.filter(challenge_tag__exact=challenge_tag).filter(tag__exact=factor_tag_name)[0]

    factor_submission = FactorSubmission(submission=submission, challenge_tag=challenge_tag, factor_tag=factor_tag, time=time, response1=responses1, response2=responses2)
    factor_submission.save()

    return HttpResponse()

@csrf_exempt
def submit_challenge3(request, origin_type, origin_name, two_pages_back, username):
    username = request.POST['username']
    factor = request.POST['factor']
    time = request.POST['time']
    responses = request.POST['responses']

    user = User.objects.filter(char_name__exact=username)[0]
    submission = Submission.objects.filter(user__exact=user)[0]

    challenge_tag = ChallengeTag.objects.filter(tag__exact="Contains_Loop")[0]
    factor_tag_name = f"Factor_{factor}"
    print(f"factor tag name is {factor_tag_name}")
    factor_tag = FactorTag.objects.filter(challenge_tag__exact=challenge_tag).filter(tag__exact=factor_tag_name)[0]

    factor_submission = FactorSubmission(submission=submission, challenge_tag=challenge_tag, factor_tag=factor_tag, time=time, response1=responses, response2="none")
    factor_submission.save()

    return HttpResponse()

def consent_form(request, origin, user):
    consent_given = None
    if origin == "consent_form":
        if 'do_you_consent' in request.GET:

            return select_challenge_page(request, "no type", 
                                         "create_key.html",
                                         "no two pages back",
                                         user)

        else:
            return render(request, 'consent_form.html', context={'user':user, 'submitted_unchecked':'yes'})

    return render(request, 'consent_form.html', context={'user':user})
    
def create_key(request, origin):
    attempted_user = None
    if origin == "create_key":
        attempted_user = request.GET['username']

    taken = [user.char_name for user in User.objects.all()]
    suggested_user = valid_username(taken)

    if attempted_user:
        if attempted_user not in taken:
            created_user = User(char_name=attempted_user)
            created_user.save()
            return consent_form(request, "create_key.html", attempted_user)
        
    return render(request, 'create_key.html',
                  context={'attempted_user':attempted_user, 'suggested_user':suggested_user})


def enter_key(request, origin):
    returning_user = None
    if origin == "enter_key":
        returning_user = request.GET['username']

    if returning_user:
        taken = [user.char_name for user in User.objects.all()]
        if returning_user in taken:
            latest_submission_snapshot = SubmissionSnapshot.objects.filter(user__char_name__exact=returning_user).filter(challenge_tag__tag__exact="Contains_Loop")
            if len(latest_submission_snapshot) != 0:
                print(f"returning user with username {returning_user}")
                return select_leaderboard(request, returning_user)

            else:
                latest_submission_snapshot = SubmissionSnapshot.objects.filter(user__char_name__exact=returning_user).filter(challenge_tag__tag__exact="Contains_Substring")

            if len(latest_submission_snapshot) != 0:
                origin_type = "challenge"
                origin_name = "contains_substring5.html"
                two_pages_back = "rest.html"
                username = returning_user
                return select_challenge_page(request, origin_type, origin_name, two_pages_back, username)
            else:
                latest_submission_snapshot = SubmissionSnapshot.objects.filter(user__char_name__exact=returning_user).filter(challenge_tag__tag__exact="H_Index")

            if len(latest_submission_snapshot) != 0:
               origin_type = challenge
               origin_name = "h_index5.html"
               two_pages_back = "rest.html"
               username = returning_user
               return select_challege_page(request, origin_type, origin_name, two_pages_back, username)

               
            
            return select_challenge_page(request, "no type",
                                         "enter_key.html",
                                         "no two pages back",
                                         returning_user)
            

    return render(request, 'enter_key.html', context={'returning_user':returning_user})

def select_leaderboard(request, username):
    user = User.objects.filter(char_name__exact=username)[0]
    print(f"called select leaderboard with username {username} and user {user}")
    submission = Submission.objects.filter(user__exact=user)[0]
    factor_submissions = FactorSubmission.objects.filter(submission__exact=submission)

    ordered_submissions = [None, None, None]
    tag_map = {"H_Index":0, "Contains_Substring":1, "Contains_Loop":2}
    for factor_submission in factor_submissions:
        index = tag_map[factor_submission.challenge_tag.tag]
        ordered_submissions[index] = factor_submission

    group_indicators = []
    group_number_map = {"Factor_1":1, "Factor_2":2, "Factor_3":3, "Factor_4":4}
    for factor_submission in ordered_submissions:
        group_number = group_number_map[factor_submission.factor_tag.tag]
        group_indicators.append(group_number)
        
    return render(request, 'select_leaderboard.html',
                  context={f"p1g{group_indicators[0]}":"yes", f"p2g{group_indicators[1]}":"yes", f"p3g{group_indicators[2]}":"yes"})

def leaderboard(request, challenge_tag, factor_tag):
    submissions_requested = FactorSubmission.objects.filter(challenge_tag__tag__exact=challenge_tag).filter(factor_tag__tag__exact=factor_tag)

    challenge_tag_to_display = {"H_Index": "Problem 1",
                                "Contains_Substring": "Problem 2",
                                "Contains_Loop": "Problem 3"}
    factor_tag_to_display = {"Factor_1": "Group 1",
                             "Factor_2": "Group 2",
                             "Factor_3": "Group 3",
                             "Factor_4": "Group 4"}

    challenge_display = challenge_tag_to_display.get(challenge_tag,
                                                     challenge_tag)
    factor_display = factor_tag_to_display.get(factor_tag,
                                               factor_tag)

    return render(request,
                  'leaderboard.html',
                  context={'submissions':submissions_requested,
                           'challenge':challenge_display,
                           'factor':factor_display})

@csrf_exempt
def take_snapshot(request, origin_type, origin_name, two_pages_back, username):
    challenge_tag_name = request.POST['prob']
    print(f"getting name {challenge_tag_name}")
    input_snapshot = request.POST['input_snapshot']
    time = request.POST['time']
    which_box = request.POST['which_box']

    matching_users = User.objects.filter(char_name__exact=username)
    user = None
    if len(matching_users) != 0:
        user = matching_users[0]

    challenge_tag = ChallengeTag.objects.filter(tag__exact=challenge_tag_name)[0]
    
    
    if user:
        snapshot_obj = SubmissionSnapshot(challenge_tag=challenge_tag,
                                          user=user,
                                          input_snapshot=input_snapshot,
                                          time=time,
                                          box=which_box)
        snapshot_obj.save()

    else:
        print(f"INVALID USERNAME: {username} in take_snapshot")
    
    return HttpResponse()

def valid_username(taken: list[str]) -> str:
    for i in range(5):
        usernames_to_try = generate_username(5 * (i + 1))
        for username in usernames_to_try:
            if username not in taken:
                return username

    return None
        
