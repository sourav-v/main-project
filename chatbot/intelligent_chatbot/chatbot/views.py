
from datetime import datetime
from django.shortcuts import redirect, render
from django.http import HttpResponse


from chatbot.models import *


# Create your views here.


def admin(request):
    return render(request,"administrator.html")


def psychiatrist(request):
    return render(request,"psychiatrist.html")


def user_home(request):
    return render(request,"user.html")




def main(request):
    return render(request,"index.html")




def user_registration(request):
    return render(request,"regindex.html")



def add_dataset(request):
    return render(request,"add dataset.html")


def editdataset(request,id):
    ob=dataset.objects.get(id=id)
    request.session['did']=id

    return render(request,"edit dataset1.html",{'val':ob})

def deletedataset(request,id):
    ob=dataset.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Succeffully deleted");window.location="/manage_dataset"</script>''')
    


def editdataset1 (request):
    que=request.POST['textfield']
    answe=request.POST['textfield2']
    
    uob=dataset.objects.get(id=request.session['did'])
    uob.questions=que
    uob.answers=answe
    uob.save()
    return HttpResponse('''<script>alert("Succeffully edited");window.location="/manage_dataset"</script>''')
    





def manage_dataset(request):
    ob=dataset.objects.all()
    return render(request,"manage dataset.html",{'val':ob})




def add_feedback(request):
    return render(request,"add_feedback.html")




def view_feedback(request):
    ob=feedback.objects.all()
    return render(request,"view_feedback.html",{'val':ob})



def add_tips(request):
    return render(request,"psy_add_tips.html")



def manage_tips(request):
    ob=tips.objects.all()
    return render(request,"psy_manage_tips.html",{'val':ob})

def deletetips(request,id):
    ob=tips.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Succeffully deleted");window.location="/manage_tips"</script>''')
    


def user_view_tips(request):
    ob=tips.objects.all()
    return render(request,"view tips user.html",{'val':ob})


def user_send_complaint(request):
    return render(request,"user_send_complaint.html")



def admin_manage_complaint(request):
     ob=complaint.objects.all()
     return render(request,"admin_manage_complaint.html",{'val':ob})



def admin_send_reply(request,id):
    ob=complaint.objects.get(id=id)
    request.session['id']=id
    return render(request,"admin_send_reply.html",{'val':ob})
    

def sendreply(request):
    re=request.POST['textfield']
    ob=complaint.objects.get(id=request.session['id'])
    ob.reply=re
    ob.save()
    
    return HttpResponse('''<script>alert("Succeffully replyed ");window.location="/admin_manage_complaint"</script>''')
    
    
    




def user_view_complaint_reply(request):
    ob=complaint.objects.all()
    return render(request,"user_view_complaint_reply.html",{'val':ob})



def psy_manage_suggestions(request):
    ob=suggestions.objects.all()
    return render(request,"psy_manage_suggestion.html",{'val':ob})



def psy_add_suggestions(request):
    return render(request,"psy_add_suggestion.html")




def user_view_suggestions(request):
    ob=suggestions.objects.all()
    return render(request,"user_view_suggestion.html",{'val':ob})



def admin_manage_psychiatrist(request):
    ob=pyschiatrist.objects.all()
    return render(request,"admin_manage_psy.html",{'val':ob})

def deletesugg(request,id):
    ob=suggestions.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Succeffully deleted");window.location="/psy_manage_suggestions"</script>''')
    



def deletepsychiatrist(request,id):
    ob=pyschiatrist.objects.get(lid__id=id)
    ob.delete()
    ob1=login.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("Succeffully deleted");window.location="/admin_manage_psychiatrist"</script>''')
    





def admin_add_psychiatrist(request):
    return render(request,"admin_add_pyschiatrist.html")


def editpsychiatrist(request,id):
    ob=pyschiatrist.objects.get(id=id)
    request.session['pid']=id

    return render(request,"editpsy.html",{'val':ob})


def editpsychiatrist1(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    pl=request.POST['textfield3']
    po=request.POST['textfield4']
    em=request.POST['textfield5']
    ge=request.POST['radiobutton']
    ph=request.POST['textfield7']
    uob=pyschiatrist.objects.get(id=request.session['pid'])
    uob.firstname=fname
    uob.lastname=lname
    uob.place=pl
    uob.gender=ge
    uob.phone=ph
    uob.post=po
    uob.email=em
    
    uob.save()
    return HttpResponse('''<script>alert("Succeffully edited");window.location="/admin_manage_psychiatrist"</script>''')
    



def user_view_psychiatrist(request):
    ob=pyschiatrist.objects.all()
    return render(request,"user_view_psy.html",{'val':ob})



def admin_view_registerd_user(request):
    ob=user.objects.all()
    return render(request,"admin_view_registerd_user.html",{'val':ob})




def psy_view_registerd_user(request):
    ob=user.objects.all()
    return render(request,"psy_view_registerd_user.html",{'val':ob})


def psy_chat(request):
    return render(request,"psy chat.html")


def user_chat(request):
    return render(request,"user chat.html")






def user1(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    pl=request.POST['textfield3']
    po=request.POST['textfield4']
    em=request.POST['textfield5']
    ge=request.POST['radiobutton']
    ph=request.POST['textfield7']
    uname=request.POST['textfield8']
    pas=request.POST['textfield9']
    
    ob=login()
    ob.username=uname
    ob.password=pas 
    ob.type='user'
    ob.save()
    
    uob=user()
    uob.firstname=fname
    uob.lastname=lname
    uob.place=pl
    uob.gender=ge
    uob.phone=ph
    uob.post=po
    uob.email=em
    uob.lid=ob
    uob.save()
    return HttpResponse('''<script>alert("Succeffully Registerd");window.location="/"</script>''')
  
    
    



def login1(request):
    try:
        uname=request.POST['textfield']
        pas=request.POST['textfield2']

        ob=login.objects.get(username=uname,password=pas)  
        if ob is None:
            return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')     
        elif ob.type == "admin":
            return HttpResponse('''<script>alert("login successfull");window.location="/admin"</script>''') 
            # return redirect("/admin")
        elif ob.type == "psychiatrist":
            request.session['lid']=ob.id
            obps=pyschiatrist.objects.get(lid__id=ob.id)
            request.session['fn']=obps.firstname+" "+obps.lastname
            return HttpResponse('''<script>alert("login successfull");window.location="/psychiatrist"</script>''') 
            # return redirect("/psychiatrist")
        elif ob.type == "user":
            request.session['lid']=ob.id
            obps=user.objects.get(lid__id=ob.id)
            request.session['fn']=obps.firstname+" "+obps.lastname
            return HttpResponse('''<script>alert("login successfull");window.location="/user_home"</script>''') 
            # return redirect("/user_home")
        else:
                return HttpResponse('''<script>alert("invalid");window.location="/"</script>''') 
    except:
            return HttpResponse('''<script>alert("invalid");window.location="/"</script>''') 

        
        
    
    

def psychiatrist1(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    pl=request.POST['textfield5']
    po=request.POST['textfield8']
    em=request.POST['textfield3']
    ge=request.POST['radiobutton']
    ph=request.POST['textfield4']
    uname=request.POST['textfield6']
    pas=request.POST['textfield7']
    
    ob=login()
    ob.username=uname
    ob.password=pas 
    ob.type='psychiatrist'
    ob.save()
    
    uob=pyschiatrist()
    uob.firstname=fname
    uob.lastname=lname
    uob.place=pl
    uob.gender=ge
    uob.phone=ph
    uob.post=po
    uob.email=em
    uob.lid=ob
    uob.save()
    return HttpResponse('''<script>alert("Succeffully Registerd");window.location="/"</script>''')
  
    


def dataset1(request):
    que=request.POST['textfield']
    answ=request.POST['textfield2']
    

    uob=dataset()
    uob.questions=que
    uob.answers=answ
    uob.save()
    return HttpResponse('''<script>alert("Succeffully ADDED");window.location="/manage_dataset"</script>''')



def suggestions1(request):
    suge=request.POST['textfield']
    desc=request.POST['textfield2']
    

    uob=suggestions()
    uob.suggestions=suge
    uob.descriptions=desc
    uob.pid=pyschiatrist.objects.get(lid__id=request.session['lid'])
    uob.date=datetime.today()
    
    uob.save()
    return HttpResponse('''<script>alert("Succeffully ADDED");window.location="/psy_manage_suggestions"</script>''')



def addtips1(request):
    tip=request.POST['textfield']
    uob=tips()
    uob.tips=tip
    uob.pid=pyschiatrist.objects.get(lid__id=request.session['lid'])
    uob.date=datetime.today()
    uob.save()
    return HttpResponse('''<script>alert("Succeffully ADDED");window.location="/manage_tips"</script>''')



def addfeedback1(request):
    feed=request.POST['textfield']
    dat=request.POST['textfield']
    rat=request.POST['select']
    

    

    uob=feedback()
    uob.feedback=feed
    uob.date=dat
    uob.rating=rat
    uob.uid=user.objects.get(lid__id=request.session['lid'])
    uob.date=datetime.today()
    
    uob.save()
    return HttpResponse('''<script>alert("Succeffully ADDED");window.location="/user_home"</script>''')



def addcomplaint1(request):
    comp=request.POST['textfield']
    
    uob=complaint()
    uob.complaint=comp
    uob.uid=user.objects.get(lid__id=request.session['lid'])
    uob.date=datetime.today()
    uob.reply='pending'
    
    uob.save()
    return HttpResponse('''<script>alert("Succeffully ADDED");window.location="/user_view_complaint_reply"</script>''')




   
    