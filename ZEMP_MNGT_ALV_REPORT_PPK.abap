*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEMP_MNGT_ALV_REPORT_PPK ."LINE-COUNT 11(2).

TYPES:BEGIN OF TY_EMP,
        PERNR TYPE PERSNO,
        CNAME TYPE PAD_CNAME,
        BTRTL TYPE BTRTL,
        BET01 TYPE PAD_AMT7S,
      END OF TY_EMP.

DATA: ITAB TYPE STANDARD TABLE OF TY_EMP,
      WA   TYPE TY_EMP.

DATA: ITAB_FIELDCAT TYPE STANDARD TABLE OF SLIS_FIELDCAT_ALV,
      WA_FIELDCAT   TYPE SLIS_FIELDCAT_ALV,
      WA_LAYOUT TYPE SLIS_LAYOUT_ALV.

DATA: PERSON_NUM TYPE PERSNO.
SELECT-OPTIONS: S_PERNR FOR PERSON_NUM.

START-OF-SELECTION.
  SELECT HR1~PERNR
           HR2~CNAME
           HR1~BTRTL
           HR8~BET01

    FROM PA0001 AS HR1 INNER JOIN PA0002 AS HR2 ON HR1~PERNR = HR2~PERNR
         LEFT JOIN PA0008 AS HR8 ON HR1~PERNR = HR8~PERNR
    INTO TABLE ITAB
    WHERE HR1~PERNR IN S_PERNR.
  IF ITAB IS INITIAL.
    MESSAGE: 'NO RECORDS FOUND' TYPE 'E'.
  ELSE.
    MESSAGE: 'RECORDS FOUND' TYPE 'S'.
  ENDIF.

  CLEAR WA_FIELDCAT.
  WA_FIELDCAT-FIELDNAME = 'PERNR'.
  WA_FIELDCAT-SELTEXT_M = 'EMPLOYEE ID'.
  APPEND WA_FIELDCAT TO ITAB_FIELDCAT.

  CLEAR WA_FIELDCAT.
  WA_FIELDCAT-FIELDNAME = 'CNAME'.
  WA_FIELDCAT-SELTEXT_M = 'COMPLETE NAME'.
  APPEND WA_FIELDCAT TO ITAB_FIELDCAT.


  CLEAR WA_FIELDCAT.
  WA_FIELDCAT-FIELDNAME = 'BTRTL'.
  WA_FIELDCAT-SELTEXT_M = 'PERSONNEL SUBAREA'.
  APPEND WA_FIELDCAT TO ITAB_FIELDCAT.

  CLEAR WA_FIELDCAT.
  WA_FIELDCAT-FIELDNAME = 'BET01'.
  WA_FIELDCAT-SELTEXT_M = 'WAGE TYPE AMOUNT FOR PAYMENTS'.
  APPEND WA_FIELDCAT TO ITAB_FIELDCAT.


WA_LAYOUT-COLWIDTH_OPTIMIZE = 'X'.
WA_LAYOUT-ZEBRA = 'X'.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
     I_CALLBACK_PROGRAM                = SY-REPID
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
     I_CALLBACK_TOP_OF_PAGE            = 'EMPLOYEE_DETAILS'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE  =
*     I_GRID_SETTINGS                   =
      IS_LAYOUT     = WA_LAYOUT
      IT_FIELDCAT   = ITAB_FIELDCAT
*     IT_EXCLUDING  =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT       =
*     IT_FILTER     =
*     IS_SEL_HIDE   =
*     I_DEFAULT     = 'X'
*     I_SAVE        = ' '
*     IS_VARIANT    =
*     IT_EVENTS     =
*     IT_EVENT_EXIT =
*     IS_PRINT      =
*     IS_REPREP_ID  =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK  =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      T_OUTTAB      = ITAB
    EXCEPTIONS
      PROGRAM_ERROR = 1
      OTHERS        = 2.
  IF SY-SUBRC <> 0.
* IMPLEMENT SUITABLE ERROR HANDLING HERE
  ENDIF.

  FORM EMPLOYEE_DETAILS.

    DATA:ITAB_HEADER TYPE TABLE OF SLIS_LISTHEADER,
         WA_HEADER TYPE SLIS_LISTHEADER.

    WA_HEADER-TYP = 'H'.
    WA_HEADER-INFO = 'EMPLOYEE DETAILS'.
    APPEND WA_HEADER TO ITAB_HEADER.
    CLEAR WA_HEADER.

    CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
      EXPORTING
        IT_LIST_COMMENTARY =  ITAB_HEADER                " COMMENT BLOCK
*        I_LOGO             =
*        I_END_OF_LIST_GRID =
*        I_ALV_FORM         =                  " USE ALV FORM ("X")
      .
  ENDFORM.
