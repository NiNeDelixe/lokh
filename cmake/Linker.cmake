macro(lokh_configure_linker project_name)
  set(lokh_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(lokh_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE lokh_USER_LINKER_OPTION PROPERTY STRINGS ${lokh_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    lokh_USER_LINKER_OPTION_VALUES
    ${lokh_USER_LINKER_OPTION}
    lokh_USER_LINKER_OPTION_INDEX)

  if(${lokh_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${lokh_USER_LINKER_OPTION}', explicitly supported entries are ${lokh_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${lokh_USER_LINKER_OPTION}")
endmacro()
