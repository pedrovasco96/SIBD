-- INDEXES

-- 1
CREATE INDEX id_vet
ON veterinary(VAT_vet);


-- 2
CREATE INDEX id_references
ON indicator(reference_value, units);
