begin;
    

        insert into my_database.myschema.melio_matching_results_dbt ("CLEANEDNAME", "COMPANYNAME", "NAME", "OFFICERS_NAME", "COMPANY_NUMBER", "DELIVERY_LINE_1", "CITY_NAME", "STATE_ABBREVIATION", "ZIPCODE", "REGISTERED_ADDRESS_STREET_ADDRESS", "REGISTERED_ADDRESS_LOCALITY", "JURISDICTION_CODE", "REGISTERED_ADDRESS_POSTAL_CODE", "RDI")
        (
            select "CLEANEDNAME", "COMPANYNAME", "NAME", "OFFICERS_NAME", "COMPANY_NUMBER", "DELIVERY_LINE_1", "CITY_NAME", "STATE_ABBREVIATION", "ZIPCODE", "REGISTERED_ADDRESS_STREET_ADDRESS", "REGISTERED_ADDRESS_LOCALITY", "JURISDICTION_CODE", "REGISTERED_ADDRESS_POSTAL_CODE", "RDI"
            from my_database.myschema.melio_matching_results_dbt__dbt_tmp
        );
    commit;