PARAMETERS: p_layout TYPE slis_vari.
 
DATA: g_alv_table TYPE REF TO cl_salv_table.
 
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_layout.
  PERFORM select_layout.
 
FORM select_layout.
  DATA: ls_layout_key  TYPE salv_s_layout_key,
        ls_layout_info TYPE salv_s_layout_info.
  ls_layout_key-report = sy-repid.
  ls_layout_info = cl_salv_layout_service=>f4_layouts( ls_layout_key ).
  p_layout = ls_layout_info-layout.
ENDFORM.                    "select_layout
 
FORM display_data.
...
  DATA: l_layout      TYPE REF TO cl_salv_layout,
        ls_layout_key TYPE salv_s_layout_key.
  l_layout = g_alv_table->get_layout( ).
  ls_layout_key-report = sy-repid.
  l_layout->set_key( ls_layout_key ).
  l_layout->set_save_restriction( ).
  l_layout->set_initial_layout( p_layout ).
...
ENDFORM.                    "display_data
