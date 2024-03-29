from django.shortcuts import render
from django.shortcuts import render , HttpResponse , redirect
from hospital.Queries import *
from hospital.Targets import *
 # Create your views here.


def Register(request):
    if not request.GET.get('show', False):
        print("sorry ")
    else:
        return render(request,'../Templates/AddPatient.html') 



def addpatient(request):
    name = request.POST['fname']
    lname = request.POST['lname']
    national_Id = request.POST['national_Id'] 
    age = request.POST['age']     
    sex = request.POST['sex']
    illness = request.POST['illness']
    section_ID = request.POST['section_ID']
    Prescribed_d = request.POST['Prescribed_d']
    Doctor_id = request.POST['Doctor_id']
    Nurse_id = request.POST['Nurse_id']
    username = request.POST['username']
    password = request.POST['pass']
    
    preferness = []
    Doctor_preferences = request.POST.get('Doctor_preferences')
    if  Doctor_preferences:
        
        preferness.append('checkup_personal_doc')
        preferness.append('prescribe_personal_doc')
        preferness.append('records_personal_doc')
    
    
    Nurses_preferences = request.POST.get('Nurses_preferences')
    if  Nurses_preferences:
        preferness.append('patient_care_personal_nurse')
        

    accounting_preferences = request.POST.get('accounting_preferences')    
    if accounting_preferences:
        preferness.append('patient_accounting')
        


    # ekhtiari ha

    if request.POST.get('checkup_section_doc'): 
        preferness.append('checkup_section_doc')
        

    if request.POST.get('prescribe_section_doc'): 
        preferness.append('prescribe_section_doc')


    if request.POST.get('records_section_doc'):
        preferness.append('records_section_doc')


    if request.POST.get('records_personal_nurse'): 
        preferness.append('records_personal_nurse')
         
    subject_id = register_patient(name,lname,int(national_Id) , int(age) , sex , illness , int(section_ID) , Prescribed_d , int(Doctor_id) , int(Nurse_id) , username , password )
    if ( subject_id== -1):
         return HttpResponse('error')
    else:
         add_patient_targets(preferness ,subject_id )
         return HttpResponse('it is ok')
