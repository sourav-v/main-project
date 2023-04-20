
from datetime import datetime
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from chatbot.models import *

from nltk.sentiment import SentimentIntensityAnalyzer
# Create your views here.


def admin(request):
    return render(request,"administrator.html")


def psychiatrist(request):
    return render(request,"psychiatrist.html")


def user_home(request):
    ob=user.objects.get(lid__id=request.session['lid'])
    request.session['img']=str(ob.image)
    img=request.session['img']
    return render(request,"user.html",{'img':request.session['img']})




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
    try:
        fname=request.POST['textfield']
        lname=request.POST['textfield2']
        img=request.FILES['file']
        fs=FileSystemStorage()
        fp=fs.save(img.name,img)
        exp=request.POST['textfield8']
        pl=request.POST['textfield3']
        po=request.POST['textfield4']
        em=request.POST['textfield5']
        ge=request.POST['radiobutton']
        ph=request.POST['textfield7']
        uob=pyschiatrist.objects.get(id=request.session['pid'])
        uob.firstname=fname
        uob.lastname=lname
        uob.expireance=exp
        uob.place=pl
        uob.gender=ge
        uob.phone=ph
        uob.post=po
        uob.email=em
        uob.image=fp
        uob.save()
        return HttpResponse('''<script>alert("Succeffully edited");window.location="/admin_manage_psychiatrist"</script>''')
    except:
        fname=request.POST['textfield']
        lname=request.POST['textfield2']
        exp=request.POST['textfield8']
        pl=request.POST['textfield3']
        po=request.POST['textfield4']
        em=request.POST['textfield5']
        ge=request.POST['radiobutton']
        ph=request.POST['textfield7']
        uob=pyschiatrist.objects.get(id=request.session['pid'])
        uob.firstname=fname
        uob.lastname=lname
        uob.expireance=exp
        uob.place=pl
        uob.gender=ge
        uob.phone=ph
        uob.post=po
        uob.email=em
        uob.save()
        return HttpResponse('''<script>alert("Succeffully edited");window.location="/admin_manage_psychiatrist"</script>''')
        
    

def sendchat(request):
    msg=request.POST['textarea']
    ob=chat()
    ob.from_id=login.objects.get(id=request.session['lid'])
    ob.to_id=login.objects.get(id=request.session['pid'])
    ob.message=msg
    ob.date=datetime.today()
    ob.save()
    return HttpResponse('''<script>window.location="/chat3"</script>''')



def sendchat1(request):
    msg=request.POST['textarea']
    ob=chat()
    ob.from_id=login.objects.get(id=request.session['lid'])
    ob.to_id=login.objects.get(id=request.session['uid'])
    ob.message=msg
    ob.date=datetime.today()
    ob.save()
    return HttpResponse('''<script>window.location="/chat4"</script>''')


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
    ob=user.objects.all()
    return render(request,"psy chat.html",{'val':ob})

def user_chat(request):
    return render(request,"user chat.html")



def user1(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    img=request.FILES['file']
    fs=FileSystemStorage()
    fp=fs.save(img.name,img)
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
    uob.image=fp
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
            request.session['pic']=obps.image.url
            return HttpResponse('''<script>alert("login successfull");window.location="/psychiatrist"</script>''') 
            # return redirect("/psychiatrist")
        elif ob.type == "user":
            request.session['lid']=ob.id
            obps=user.objects.get(lid__id=ob.id)
            request.session['fn']=obps.firstname+" "+obps.lastname
            request.session['pic']=obps.image.url   
            return HttpResponse('''<script>alert("login successfull");window.location="/user_home"</script>''') 
            # return redirect("/user_home")
        else:
                return HttpResponse('''<script>alert("invalid");window.location="/"</script>''') 
    except:
            return HttpResponse('''<script>alert("invalid");window.location="/"</script>''') 
    
def sendchatbot(request):
    q=request.POST['q']
    qid=request.POST['qid']
    msg=request.POST['textarea']
    button=request.POST['button']
    if button == "send":
        sia = SentimentIntensityAnalyzer()
        sm=sia.polarity_scores(msg)
        # {'neg': 0.0, 'neu': 0.295, 'pos': 0.705, 'compound': 0.8012}
        scr=2.5
        if sm['neg']>sm['pos']:
            scr=5-5*sm['neg']
            if scr>2.5:
                scr=scr-2.5
        elif sm['neg']<sm['pos']:
            scr=5*sm['neg']
            if scr<2.5:
                scr=scr+2.5
                
        ob=chatbot()
        ob.questions=q
        ob.reply=msg
        ob.sentiments=str(scr)
        ob.pid=user.objects.get(lid__id=request.session['lid'])
        ob.save()
        ob=chatbot.objects.filter(pid__lid__id=request.session['lid'])
        result=[]
        for i in ob:
            row={"from_id":"0","chat":i.questions}
            result.append(row)
            row={"from_id":"1","chat":i.reply}
            result.append(row)
        qid=int(qid)+1
        ob=query.objects.get(id=qid)
        row={"from_id":"0","chat":ob.query}
        result.append(row)
        return render(request,"chat_bot.html",{"val":result,"q":ob.query,"qid":qid})
    else:
        from django.db.models import Avg
        ob=chatbot.objects.filter(pid__lid__id=request.session['lid']).aggregate(Avg('sentiments'))
        print(ob,"======================")
        if ob['sentiments__avg'] > int(2.5):
            return HttpResponse(" you are a happy person.Make others too happy")
        elif ob['sentiments__avg'] > int(2):
            return HttpResponse("keep yourself motivated and be happy")
        elif ob['sentiments__avg'] > int(1.5):
            return HttpResponse("you are at the verge of getting depressed.try to do some meditations")
        elif ob['sentiments__avg'] > int(1):
            return HttpResponse("you are depressed.but you can overcome by doing meditations,hearing positive musics,reading books etc")
        else:
            return HttpResponse("you are very depressed.please consult a doctor")
        

        


def finish_chatbot(request):
    from django.db.models import Avg
    ob=chatbot.objects.filter(pid__lid__id=request.session['lid']).aggregate(Avg('sentiments'))
    print(ob,"======================")
    if ob.score < int(0.4):
        return HttpResponse("keep yourself motivated and be happy")
    elif ob.score < int(0.1):
        return HttpResponse("you are very depressed.please consult a doctor")
    return
        
    


# def sendchatbot2(request):
#     q=request.POST['q']
#     msg=request.POST['textarea']
#     ob=chatbot()
#     ob.questions=q
#     ob.reply=msg
#     ob.pid=user.objects.get(lid__id=request.session['lid'])
#     ob.save()
    
#     return redirect('/sendchatbot')

def chatbot_start(request):
    ob=chatbot.objects.filter(pid__lid__id=request.session['lid'])
    for i in ob:
        i.delete()
    ob=query.objects.get(id=1)
    row={"from_id":"0","chat":ob.query}
    return render(request,"chat_bot.html",{"val":[row],"q":ob.query,"qid":"1"})


def psychiatrist1(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    img1=request.FILES['file']
    fs=FileSystemStorage()
    fp=fs.save(img1.name,img1)
    exp=request.POST['textfield10']
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
    uob.image=fp
    uob.expireance=exp
    uob.place=pl
    uob.gender=ge
    uob.phone=ph
    uob.post=po
    uob.email=em
    uob.lid=ob
    uob.save()
    return HttpResponse('''<script>alert("Succeffully Registerd");window.location="/admin_manage_psychiatrist"</script>''')
  
    


def dataset1(request):
    que=request.POST['textfield']
    # answ=request.POST['textfield2']
    

    uob=dataset()
    uob.questions=que
    # uob.answers=answ
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


def chat1(request,id):
    request.session['pid']=id
    ob=pyschiatrist.objects.get(lid__id=id)
    from django.db.models import Q
    obb=chat.objects.filter(Q(from_id=request.session['lid'],to_id=request.session['pid'])|Q(from_id=request.session['pid'],to_id=request.session['lid']))
    return render(request,"chat.html",{'name':ob.firstname+" "+ob.lastname,'data':obb,'fr':request.session['lid']})

def chat3(request):
    ob=pyschiatrist.objects.get(lid__id=request.session['pid'])
    from django.db.models import Q
    obb=chat.objects.filter(Q(from_id=request.session['lid'],to_id=request.session['pid'])|Q(from_id=request.session['pid'],to_id=request.session['lid']))
    return render(request,"chat.html",{'name':ob.firstname+" "+ob.lastname,'data':obb,'fr':request.session['lid']})

   
def chat2(request,id):
    request.session['uid']=id
    ob=user.objects.get(lid__id=id)
    from django.db.models import Q
    obb=chat.objects.filter(Q(from_id=request.session['lid'],to_id=request.session['uid'])|Q(from_id=request.session['uid'],to_id=request.session['lid']))
    return render(request,"chat2.html",{'name':ob.firstname+" "+ob.lastname,'data':obb,'fr':request.session['lid']})

def chat4(request):
    ob=user.objects.get(lid__id=request.session['uid'])
    from django.db.models import Q
    obb=chat.objects.filter(Q(from_id=request.session['lid'],to_id=request.session['uid'])|Q(from_id=request.session['uid'],to_id=request.session['lid']))
    return render(request,"chat2.html",{'name':ob.firstname+" "+ob.lastname,'data':obb,'fr':request.session['lid']})


