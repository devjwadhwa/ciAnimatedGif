if(NOT TARGET ciAnimatedGif)
    # Define ${Cinder-MIDI2_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(ciAnimatedGif_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${ciAnimatedGif_PROJECT_ROOT}/../.." ABSOLUTE)

    #    # Translate the <staticLibrary> tag.
    #    # pocketsphinx
    #    add_library(pocketsphinx STATIC IMPORTED)
    #    set_property(TARGET pocketsphinx PROPERTY IMPORTED_LOCATION "${Cinder-MIDI2_PROJECT_ROOT}/lib/macosx/libpocketsphinx.a")
    #
    #    # sphinxbase
    #    add_library(sphinxbase STATIC IMPORTED)
    #    set_property(TARGET sphinxbase PROPERTY IMPORTED_LOCATION "${Cinder-MIDI2_PROJECT_ROOT}/lib/macosx/libsphinxbase.a")

    # Translate the <sourcePattern> tag.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.cpp"
            )

    # Create the library from the source files. The target is now defined.
    add_library(ciAnimatedGif ${SOURCE_LIST})

    # Link the prebuilt libraries.
    #target_link_libraries(-framework CoreMIDI)
    #    target_link_libraries(Cinder-MIDI2 CoreMIDI.framework)
    #    target_link_libraries(Cinder-MIDI2 -framework CoreMIDI.framework)

    # Translate <includePath> tag.
    target_include_directories(ciAnimatedGif PUBLIC
            "${ciAnimatedGif_PROJECT_ROOT}/src/"
            )

    # Translate <headerPattern> tag.
    target_include_directories(ciAnimatedGif PRIVATE
            #            "${Cinder-MIDI2_PROJECT_ROOT}/include/sphinx"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.h"
            )

    target_include_directories(ciAnimatedGif SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )
endif()