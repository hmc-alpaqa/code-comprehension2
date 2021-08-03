from django.urls import path
from . import views

urlpatterns = [
    #allows user to choose between creating a key or entering an existing
    #one, redirects depending on choice
    path('', views.login_or_new, name='login_or_new'),

    #allows new user to create a key, sends user back to this url or
    #to challenge_form depending on availability of their key (username)
    path('create_key/<str:origin>/', views.create_key, name='create_key'),

    #Conditionally directs to a specific challenge page
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/', views.select_challenge_page, name='select_challenge_page'),

    #Submits the first challenge
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/submit_challenge1/', views.submit_challenge1, name='submit_challenge1'),

    #Submits the second challenge
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/submit_challenge2/', views.submit_challenge2, name='submit_challenge2'),

    #Submits the third challenge
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/submit_challenge3/', views.submit_challenge3, name='submit_challenge3'),


    
    #allows returning user to enter exising key, send user back to this
    #url or to leaderboard view, depending on whether the key exists
    path('enter_key/<str:origin>', views.enter_key, name='enter_key'),

    #allows user to select which leaderboard they would like to view,
    #sends them to that leaderboard
    path('submissions/', views.select_leaderboard, name='select_leaderboard'),

    #displays a leaderboard for a specific group in a specific challenge
    #problem
    path('submissions/<str:challenge_tag>/<str:factor_tag>/',
         views.leaderboard, name='leaderboard'),

    #takes snapshot of user input from challenge_form
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/take_snapshot/', views.take_snapshot, name='take_snapshot'),

    
    
    #submits the challenge and redirects the user to the leaderboard page
    path('select_challenge_page/<str:origin_type>/<str:origin_name>/<str:two_pages_back>/<str:username>/submit_challenge/', views.submit_challenge, name='submit_challenge'),
]
