
  create or replace  view my_database.myschema.melio_matching_3_model
  
   as (
    SELECT a.cleanedname, a.companyname, c.name, '' as officers_name, c.company_number, a.delivery_line_1, a.city_name,
    a.state_abbreviation, a.zipcode,
    c.registered_address_street_address, c.registered_address_locality,
    c.jurisdiction_code, c.registered_address_postal_code,
        a.rdi
    FROM myschema.melio_input a
    LEFT JOIN myschema.melio_matching_1_model b
    on a.companyname = b.companyname
    inner join myschema.oc_companies c
    on UPPER(a.cleanedname) = TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(c.name  
                ), ' INCORPORATED', ' '  
                ), ' CORPORATION', ' '  
                ), ' LIMITED', ' '  
                ), ' RECEIVERSHIP', ' '  
                ), ' SERVICE', ' '  
                ), ' SERVICES', ' '  
                ), ' COMPANY', ' '  
                ), ' MANAGEMENT', ' '  
                ), ' REFI', ' '  
                ), ' SUBCHAPTER V', ' '  
                ), ' INC', ' '  
                ), ' CORP', ' '  
                ), ' LTD', ' '  
                ), ' PLLC', ' '  
                ), ' LLC', ' '  
                ), ' L L C', ' '  
                ), ' PC', ' '  
                ), ' LP', ' '  
                ), ' AND ', ' '  
                ), ' CO ', ' '  
                ), ' MG', ' '  
                ), '.', ' '  
                ), ',', ' '  
                ), '#', ' '  
                ), '&', ' '  
                ), '$', ' '  
                ), '"', ' '  
                ), '''', ' '  
                ), '`', ' '  
                ), '_', ' '  
                ), '-', ' '  
                ), '+', ' '  
                ), '    ', ' '  
                ), '   ', ' '  
                ), '  ', ' '
                )  
            ) 
    and upper(a.state_abbreviation) = split_part(upper(c.jurisdiction_code), '_', 2)
    where b.companyname is null
  );
