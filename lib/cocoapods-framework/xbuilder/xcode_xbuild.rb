module Pod
  class XBuilder
    module XcodeXBuilder
      def xcode_xbuild(defines, configuration, work_dir, build_dir = 'export',is_simulator)
        if defined?(Pod::DONT_CODESIGN)
          defines = "#{defines} CODE_SIGN_IDENTITY=\"\" CODE_SIGNING_REQUIRED=NO"
        end
        pwd = Pathname.pwd
        Dir.chdir work_dir
        dsym_dir_name = "iphoneos"
        if is_simulator 
          dsym_dir_name = "iphonesimulator"
        end
        dsym_dir = "#{build_dir}/#{configuration}-#{dsym_dir_name}"
        UI.puts "dsym dir is :#{dsym_dir}"
        command = "xcodebuild #{defines} BUILD_DIR=#{build_dir} ONLY_ACTIVE_ARCH=NO GCC_GENERATE_DEBUGGING_SYMBOLS=YES DWARF_DSYM_FOLDER_PATH=#{dsym_dir} BUILD_LIBRARY_FOR_DISTRIBUTION=YES clean build -configuration #{configuration} -alltargets 2>&1"
        output = `#{command}`.lines.to_a
        Dir.chdir pwd
        if $?.exitstatus != 0
          Pod::ErrorUtil.error_report command,output
          Process.exit -1
        end
      end
    end
  end
end
