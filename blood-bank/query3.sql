SELECT blood_scan.sample_id, sample_bgroup, scan_status
FROM blood_sample join blood_scan on blood_sample.sample_id = blood_scan.sample_id
WHERE scan_status="Contaminated";