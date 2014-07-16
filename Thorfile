require 'thor'
require 'fileutils'
require 'timeout'
require 'digest'
require 'digest/sha1'

ffp_vmw_image = 'images/firefly/download'
ffp_vmw_sha1 = "ec6c892fabfb07e8df5e8a68c78e3f5aa62b3fd4"
ffp_image_dir = "./images/firefly"
ffp_download_dir = "./images/firefly/download"


class Firefly < Thor

  desc "prep", "Prep Firefly Perimeter images"
  def prep
    ffp_vmw_image = 'images/firefly/download'
    Dir.chdir ffp_vmw_image do
      ovas = Dir.glob("*.ova")
      ovas.each do |ova|
        `tar xzf #{ova}`
        puts "#{ova}"
      end
    end
  end


end

class Packer < Thor

  desc "validate", "Validate Packer templates"
  def validate
    Dir.chdir './packer' do
    templates = Dir.glob("*.json")
    templates.each do |template|
      puts "#{template}"
    unless system "packer validate #{template}"
        fail "Validation failed"
    end
    puts "\n"
    end
  end
  end

  desc "clean", "Clean up packer cache + builds"
  def clean(what)
    if what == "cache"
      Fileutils.rm_rf(Dir.glob('./packer/packer_cache/*'))
    elsif what == "boxes"
      Fileutils.rm_rf(Dir.glob('./packer/*.box'))
    end
  end

  desc "build", "Build Firefly Perimeter images"
  def build
    Dir.chdir './packer' do
      templates = Dir.glob('*.json')
      templates.each do |template|
        system = "packer build #{template}"
      end
    end
  end

end
