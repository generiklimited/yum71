require 'grape'
require 'uri'
module Yum71
  class API < Grape::API
    require 'yumrepo'
    version 'v1', using: :header, vendor: 'generik'

    helpers do
      def package_list(repo)
        #YumRepo::PackageList.new "http://rbel.frameos.org/stable/el5/x86_64"
        YumRepo::PackageList.new repo
      end
    end
    resource :jenkins do
      desc "Available versions of a package"
      params do
        requires :name, type: String, desc: "Package name"
        requires :repo, type: String, desc: "HTTP URI for repository"
      end
      get :package_versions do
        uri = URI.parse(params[:repo])
        if uri.scheme == 'http'
        { name: params[:name],
          versions: 
        package_list(uri.to_s).all.select{|p|
            p.name == params[:name]
          }.collect {|p|
                     "#{p.version}-#{p.release}"
          }
        }
        else 
          error!('406 Not acceptable repo',406)
        end
      end
      
    end

  end
end
