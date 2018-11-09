SELECT distinct P.name
FROM person P, veterinary V, assistant A, consult CO
WHERE (P.VAT=CO.VAT_client)
      AND (CO.VAT_client=V.VAT OR CO.VAT_client=A.VAT);
