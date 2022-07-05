

      create or replace transient table my_database.myschema.melio_matching_results_dbt_model  as
      (

SELECT * FROM  my_database.myschema.melio_matching_first_model
UNION ALL
SELECT * FROM my_database.myschema.melio_matching_second_model
UNION ALL 
SELECT * FROM my_database.myschema.melio_matching_third_model
      );
    