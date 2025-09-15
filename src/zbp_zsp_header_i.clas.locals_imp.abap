CLASS lhc_salesheader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR salesheader RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR salesheader RESULT result.

    METHODS SetDelivery FOR MODIFY
      IMPORTING keys FOR ACTION salesheader~SetDelivery RESULT result.

    METHODS SetStatus FOR MODIFY
      IMPORTING keys FOR ACTION salesheader~SetStatus RESULT result.

    METHODS setcustomer FOR DETERMINE ON SAVE
      IMPORTING keys FOR salesheader~setcustomer.
    METHODS setdownload FOR MODIFY
      IMPORTING keys FOR ACTION salesheader~setdownload RESULT result.

    METHODS setupload FOR MODIFY
      IMPORTING keys FOR ACTION salesheader~setupload RESULT result.

ENDCLASS.

CLASS lhc_salesheader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD SetDelivery.
  ENDMETHOD.

  METHOD SetStatus.

  READ ENTITIES OF zsp_header_i IN LOCAL MODE
    ENTITY salesheader
    FIELDS ( status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_status).

  MODIFY ENTITIES OF zsp_header_i IN LOCAL MODE
    ENTITY salesheader
    UPDATE FIELDS ( status )
    WITH VALUE #(
      FOR ls_status IN lt_status
        ( %tky   = ls_status-%tky
          status = COND #(
                     WHEN ls_status-status = ' ' THEN 'O'
                     WHEN ls_status-status = 'O' THEN 'P'
                     WHEN ls_status-status = 'P' THEN 'C'
                     WHEN ls_status-status = 'C' THEN 'D'
*                     ELSE ls_status-status  " fallback
                   )
        )
    )
    FAILED DATA(failed_status)
    REPORTED DATA(reported_status).

   result = VALUE #( FOR statuss IN lt_status ( %tky = statuss-%tky
                                              %param = statuss ) ).

*  IF failed IS NOT INITIAL.
*    cl_abap_console=>write( |Update failed: { failed }| ).
*  ENDIF.

ENDMETHOD.


  METHOD setcustomer.
      "Read the entity Travel using EML
    READ ENTITIES OF zsp_header_i IN LOCAL MODE
         ENTITY Salesheader
         FIELDS ( Customer )
         WITH CORRESPONDING #( keys )
         RESULT DATA(lt_cust).

    " Delete the Record where travel id is already existing
    DELETE lt_cust WHERE customer IS NOT INITIAL.

    SELECT SINGLE FROM zsp_sales_header FIELDS MAX( customer ) INTO @DATA(lv_cust_max).

    " Modify EML
    MODIFY ENTITIES OF zsp_header_i IN LOCAL MODE
          ENTITY Salesheader
          UPDATE FIELDS ( Customer )
          WITH VALUE #( FOR ls_cust_id IN lt_cust INDEX INTO lv_index
                           ( %tky = ls_cust_id-%tky
                             Customer = lv_cust_max + lv_index
                              ) ).
  ENDMETHOD.

  METHOD SetDownload.
  ENDMETHOD.

  METHOD SetUpload.
  ENDMETHOD.

ENDCLASS.
