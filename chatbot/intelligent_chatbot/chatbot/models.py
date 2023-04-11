from django.db import models

# Create your models here.

class login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)
    
class user(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE) 
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    image=models.FileField()
    place=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    post=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    
    
    
class feedback(models.Model):
    uid=models.ForeignKey(user,on_delete=models.CASCADE) 
    feedback=models.CharField(max_length=100)
    rating=models.CharField(max_length=100)
    date=models.DateField()
    
    
class complaint(models.Model):
    uid=models.ForeignKey(user,on_delete=models.CASCADE) 
    complaint=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    date=models.DateField()
    
class dataset(models.Model):
    questions=models.CharField(max_length=250)
  
    
    
class pyschiatrist(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE) 
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    expireance=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    image=models.FileField()
    post=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    


class suggestions(models.Model):
    pid=models.ForeignKey(pyschiatrist,on_delete=models.CASCADE) 
    suggestions=models.CharField(max_length=250)
    descriptions=models.CharField(max_length=250)
    date=models.DateField()
    
    
class tips(models.Model):
    pid=models.ForeignKey(pyschiatrist,on_delete=models.CASCADE) 
    tips=models.CharField(max_length=250)
    date=models.DateField()
    
    
class chat(models.Model):
    from_id=models.ForeignKey(login,on_delete=models.CASCADE,related_name='fid') 
    to_id=models.ForeignKey(login,on_delete=models.CASCADE,related_name='tid') 
    message=models.CharField(max_length=100) 
    date=models.DateField() 
    
      
class chatbot(models.Model):
    pid=models.ForeignKey(user,on_delete=models.CASCADE) 
    questions=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    
    
      
    