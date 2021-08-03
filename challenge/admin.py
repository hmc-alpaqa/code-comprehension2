from django.contrib import admin
from .models import User, Submission, FactorSubmission, ChallengeTag, FactorTag, SubmissionSnapshot, FinalQuestions

# Register your models here.
admin.site.register(User)
admin.site.register(Submission)
admin.site.register(FactorSubmission)
admin.site.register(ChallengeTag)
admin.site.register(FactorTag)
admin.site.register(SubmissionSnapshot)
admin.site.register(FinalQuestions)
