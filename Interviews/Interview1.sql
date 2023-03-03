SELECT SUBSTRING(pmt_date,1,7) as month, 
CASE WHEN pmt_type_code IN (1,2,5,12,13) THEN 'AutoPay'
	 WHEN pmt_type_code IN (18,20,28,25) THEN 'Branch'
     WHEN pmt_type_code IN (30,49,50) THEN 'EOS'
     WHEN pmt_type_code IN (200,222,205) THEN 'IVR'
     WHEN pmt_type_code IN (300,301,401) THEN 'Paper'
     WHEN pmt_type_code IN (726,756,765) THEN 'Third Party'
     WHEN pmt_type_code IN (980,990,991,999) THEN 'Mobile phone pay'
     ELSE 'Others'
     END AS payment_type, 
     COUNT(*) AS payment_cnt
From pmt_dt_detail
WHERE SUBSTRING(pmt_date,1,7) = '2014-07' AND country_code =1
GROUP BY 1,2;

SELECT SUBSTRING(pmt_date,1,7) as month, 
CASE WHEN pmt_type_code IN (1,2,5,12,13) THEN 'AutoPay'
	 WHEN pmt_type_code IN (18,20,28,25) THEN 'Branch'
     WHEN pmt_type_code IN (30,49,50) THEN 'EOS'
     WHEN pmt_type_code IN (200,222,205) THEN 'IVR'
     WHEN pmt_type_code IN (300,301,401) THEN 'Paper'
     WHEN pmt_type_code IN (726,756,765) THEN 'Third Party'
     WHEN pmt_type_code IN (980,990,991,999) THEN 'Mobile phone pay'
     ELSE 'Others'
     END AS payment_type, 
     COUNT(*) AS payment_cnt
From pmt_dt_detail
WHERE SUBSTRING(pmt_date,1,7) = '2015-07' AND country_code =1
GROUP BY 1,2;
