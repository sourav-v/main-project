
from django.urls import path

from chatbot import views


urlpatterns=[
    path('',views.main,name="main"),
    path('login1',views.login1,name="login1"),
    
    
    
    path('admin',views.admin,name="admin"),
    
    path('psychiatrist',views.psychiatrist,name="psychiatrist"),
    
    path('user_home',views.user_home,name="user_home"),   
    
    
    path('user_registration',views.user_registration,name="user_registration"),
    path('user1',views.user1,name="user1"),
    
    
    path('add_dataset',views.add_dataset,name="add_dataset"),
    path('dataset1',views.dataset1,name="dataset1"),
    
    
    path('editdataset/<int:id>',views.editdataset,name="editdataset"),
    path('editdataset1',views.editdataset1,name="editdataset1"),
    
    
    path('manage_dataset',views.manage_dataset,name="manage_dataset"),
    path('deletedataset/<int:id>',views.deletedataset,name="deletedataset"),

    
    
    
    path('add_feedback',views.add_feedback,name="add_feedback"),
    path('addfeedback1',views.addfeedback1,name="addfeedback1"),
    
    
    path('view_feedback',views.view_feedback,name="view_feedback"),
    
    
    path('add_tips',views.add_tips,name="add_tips"),
    path('addtips1',views.addtips1,name="addtips1"),
    
    
    
    path('manage_tips',views.manage_tips,name="manage_tips"),
    path('deletetips/<int:id>',views.deletetips,name="deletetips"),
    
    
    path('user_view_tips',views.user_view_tips,name="user_view_tips"),
    
    path('user_send_complaint',views.user_send_complaint,name="user_send_complaint"),
    path('addcomplaint1',views.addcomplaint1,name="addcomplaint1"),
    
    
    path('admin_manage_complaint',views.admin_manage_complaint,name="admin_manage_complaint"),
    
    path('admin_send_reply/<int:id>',views.admin_send_reply,name="admin_send_reply"),
    path('sendreply',views.sendreply,name="sendreply"),
    
    
    path('user_view_complaint_reply',views.user_view_complaint_reply,name="user_view_complaint_reply"),
    
    
    path('psy_manage_suggestions',views.psy_manage_suggestions,name="psy_manage_suggestions"),
    path('deletesugg/<int:id>',views.deletesugg,name="deletesugg"),
    
    
    path('psy_add_suggestions',views.psy_add_suggestions,name="psy_add_suggestions"),
    path('suggestions1',views.suggestions1,name="suggestions1"),
    
    
    path('user_view_suggestions',views.user_view_suggestions,name="user_view_suggestions"),
    
    
    path('admin_manage_psychiatrist',views.admin_manage_psychiatrist,name="admin_manage_psychiatrist"),
    path('deletepsychiatrist/<int:id>',views.deletepsychiatrist,name="deletepsychiatrist"),
    
    
    path('editpsychiatrist/<int:id>',views.editpsychiatrist,name="editpsychiatrist"),
    path('editpsychiatrist1',views.editpsychiatrist1,name="editpsychiatrist1"),
     
    path('admin_add_psychiatrist',views.admin_add_psychiatrist,name="admin_add_psychiatrist"),
    path('psychiatrist1',views.psychiatrist1,name="psychiatrist1"),
      
    path('user_view_psychiatrist',views.user_view_psychiatrist,name="user_view_psychiatrist"),
       
    path('admin_view_registerd_user',views.admin_view_registerd_user,name="admin_view_registerd_user"),
    
    path('psy_view_registerd_user',views.psy_view_registerd_user,name="psy_view_registerd_user"),
    
    path('psy_chat',views.psy_chat,name="psy_chat"),
    path('user_chat',views.user_chat,name="user_chat"),
        path('chat1/<int:id>',views.chat1,name="chat1"),
        path('sendchat',views.sendchat,name='sendchat'),
        path('chat3',views.chat3,name='chat3'),

    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
]