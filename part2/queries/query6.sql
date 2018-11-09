SET @assistant_count = (SELECT count(P.VAT_assistant)
                          FROM consult C, participation P
                          WHERE YEAR(C.date_timestamp)=2017
                          AND P.date_timestamp=C.date_timestamp
                          AND P.VAT_owner=C.VAT_owner);
SET @operation_count = (SELECT count(O.num)
                          FROM consult C, operation O
                          WHERE YEAR(C.date_timestamp)=2017
                          AND O.date_timestamp=C.date_timestamp
                          AND O.VAT_owner=C.VAT_owner);
SET @diagnosis_count = (SELECT count(D.code)
                          FROM consult C, consult_diagnosis D
                          WHERE YEAR(C.date_timestamp)=2017
                          AND D.date_timestamp=C.date_timestamp
                          AND D.VAT_owner=C.VAT_owner);
SET @prescription_count = (SELECT count(PC.code)
                          FROM consult C, prescription PC
                          WHERE YEAR(C.date_timestamp)=2017
                          AND PC.date_timestamp=C.date_timestamp
                          AND PC.VAT_owner=C.VAT_owner);
SET @total = (SELECT count(C.date_timestamp)
                          FROM consult C
                          WHERE YEAR(C.date_timestamp)=2017);
SELECT  @assistant_count/@total as 'avg assistants',
        @prescription_count/@total as 'avg procedures',
        @diagnosis_count/@total as 'avg diagnostics',
        @prescription_count/@total as 'avg prescriptions';
