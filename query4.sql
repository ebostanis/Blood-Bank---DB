SELECT donor.donor_id, donor.donor_name, donor_phNo, sample_id, sample_bgroup
FROM blood_sample join donor on blood_sample.donor_id = donor.donor_id
WHERE sample_status = "Contaminated";