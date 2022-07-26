A note to the teacher : Some of the queries were not in the syllabus and I took the help of the internet. Source of the help is [this](http://www.cse.chalmers.se/edu/year/2018/course/TDA357/HT2018/lectures/TDA357-L08-RelationalAlgebra.pdf). 



1. $$\ \Pi _{TradeName} \bigg(\sigma_ {genereicFlag=True \ \cap  \ UnitPrice< 150}(Medicine)\bigg)$$
 


 $$ C \leftarrow \Pi_{FirstName,LastName}\bigg(A \Join_{SSN=PrimaryDoctor\_SSN}(Patient)\bigg)$$

3.  $$ A \leftarrow \Pi_{SSN}(Doctor)– \Pi_{SSN \leftarrow PrimaryDoctor\_ SSN}(Patient)$$

$$ C \leftarrow \Pi_{FirstName,LastName}\bigg(A \Join (Doctor)\bigg)$$ 



4. $$ A \leftarrow \gamma\ _ {TradeName \ , \ CNT \  \leftarrow \  count(Prescription\ \  \_Id)}.SUM_ {\leftarrow \   sum(NumOfUnits)} (Prescription_Medicine)$$

$$ C \leftarrow \Pi_{tradename.sum} \bigg(\sigma\ _{CNT >20}(A)\bigg)$$



5.$$A \leftarrow \Pi\ _{Id \leftarrow \ PM1.Prescription\\ \  _Id} \bigg(\rho\ _{PM1} (Prescription_Medicine) \Join\_  {PM1.Prescription_\ Id = PM2.Prescription_\ Id \ \cap \ PM1.TradeName=‘Paracetamol’ \  \cap \  PM2.TradeName=‘Vitamin}(Prescription_Medicine)\bigg)$$

$$C \leftarrow \Pi_{Patient\_SSN} (A \Join  Prescription)$$

6. $$A \leftarrow \Pi\ _{ID}\bigg(\sigma_{"FirstName = ‘Rakesh’ \ \cap \  LastName=‘Sharma’}(Doctor) \Join\ _ {SSN=Doctor\_SSN} Prescription\bigg)$$
 $$\ \ \ \ \ \ \  B  \leftarrow \Pi\ _{ID  \leftarrow Prescription\_id} \bigg(\sigma\ _{"TradeName=‘Paracetamol’}(Prescription\_ Medicine)\bigg) \cap A$$
$$C  \leftarrow \delta\bigg(\Pi\ _{!Pateint_SSN} ( B \Join Prescription)\bigg) $$


7. $$A \leftarrow \Pi\ _{SSN}(Patient \Join\ _{SSN=Patient_SSN \cap Doctor\ _SSN<>PrimaryDoctor\_SSN} Prescription)$$
$$B \leftarrow \Pi\ _{SSN}(Patient) - A$$
$$C \leftarrow \Pi\ _{FirstName\ , \ LastName}(B \Join Patient)$$