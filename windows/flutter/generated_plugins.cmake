#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  clipboard_watcher
  hotkey_manager
  protocol_handler
  screen_capturer
  screen_retriever
  screen_text_extractor
  tray_manager
  url_launcher_windows
  window_manager
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)
