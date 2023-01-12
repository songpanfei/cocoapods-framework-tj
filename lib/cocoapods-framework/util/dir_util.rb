module Pod
  module DirUtil
    def create_target_directory_path_by_spec spec,force
      target_dir = "#{Dir.pwd}/#{spec.name}-#{spec.version}"

      if File.exist? target_dir
        if @force
          Pathname.new(target_dir).rmtree
        else
          UI.warn "Target directory '#{target_dir}' already exists."
        end
      end
      #/Users/songpanfei/Desktop/PodDemo/module_MessageCenter/code/MessageCenter-0.0.412-MessageCenter-beta.676
      target_dir
    end

    def create_working_directory_by_spec spec,force
      if spec.is_a? String
        return create_working_directory_by_name spec,force
      end
      target_dir = create_target_directory_path_by_spec spec,force
      # Pathname.new(target_dir).mkdir
      # /var/folders/d5/t7p1sj2d33g_8k82sq3ycfsm0000gn/T/frameworks-ra6jjpmq
      work_dir = Dir.tmpdir + '/frameworks-' + Array.new(8) { rand(36).to_s(36) }.join

      Pathname.new(work_dir).mkdir
      [target_dir, work_dir]
    end

    def create_target_directory_path_by_name name, force
      target_dir = "#{Dir.pwd}/#{name}-muti"

      if File.exist? target_dir
        if @force
          Pathname.new(target_dir).rmtree
        else
          UI.warn "Target directory '#{target_dir}' already exists."
        end
      end
      target_dir
    end

    def create_working_directory_by_name name, force
      target_dir = create_target_directory_path_by_name name,force
      # Pathname.new(target_dir).mkdir
      work_dir = Dir.tmpdir + '/frameworks-' + Array.new(8) { rand(36).to_s(36) }.join

      Pathname.new(work_dir).mkdir
      [target_dir, work_dir]
    end
  end
end