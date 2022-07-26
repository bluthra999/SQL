1. Select Tradename from Medicine 
where genereic flag = true and unit price < 150 ; 
2.select P.Firstname , P.Lastname
from Patient as P join Doctor as D on D.SSN = P.PrimaryDoctor_SSN
where D.FirstName = 'Rakesh' and D.LastName = 'Sharma';
3. select d.Firstname , d.Lastname from Doctor as d
left OUTER join Patient as P 
on D.SSN = P.PrimaryDoctor_SSN  
where P.SSn = NULL  ; 



4. 
select TradeName, sum(Quantity)
from Prescription_Medicine
group by TradeName
having count(TradeName) > 20

5. select p.Patient_SSN
from Prescription as p
join Prescription_Medicine as m on p.ID = m.PrescriptionID
where m.tradename = 'Vitamin' AND   m.tradename = 'Aspirin' ; 

6.   select DISTINCT  p.Patient_SSN
from Prescription as p
join Prescription_Medicine as m on p.ID = m.PrescriptionID 
join Doctor as D on d.SSN = p.Doctor_SSN 
where m.tradename = 'Paracetamol' 
and   D.Firstname  = 'Rakesh' and D.Lastname = 'Sharma' ; 


7. 
select p.Firstname, p.Lastname
from Patient p
where not exists
(
  select pr.ID from Prescription pr
  where pr.Patient_SSN = p.SSN
  and not pr.Doctor_SSN = p.PrimaryDoc_SSN
);
