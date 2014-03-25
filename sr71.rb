module Sr71
  class API < Grape::API
    require 'yumrepo'
    version 'v1', using: :header, vendor: 'generik'

    helpers do
      def package_list
        #YumRepo::PackageList.new "http://rbel.frameos.org/stable/el5/x86_64"
        YumRepo::PackageList.new 'repos/pearson-jenkins-centos6'
      end
    end
    resource :jenkins do
      desc "Available versions of a package"
      params do
        requires :name, type: String, desc: "Package name"
      end
      get :package_versions do
        { name: params[:name],
          versions: 
        package_list.all.select{|p|
            p.name == params[:name]
          }.collect {|p|
                     "#{p.version}-#{p.release}"
          }
        }
      end
      
    end

  end
end
