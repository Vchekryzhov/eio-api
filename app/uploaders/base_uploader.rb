class BaseUploader < CarrierWave::Uploader::Base

  def url
    ENV['ASSET_HOST'] + super
  end

  def set_color
    manipulate! do |source|
      pixels = source.get_pixels.inject { |arr, arr2| arr.concat(arr2) }
      sum_pixel = pixels.each_with_object([0, 0, 0]) do |pixel, result|
        result[0] += pixel[0]
        result[1] += pixel[1]
        result[2] += pixel[2]
      end
      avg_pixel = []
      avg_pixel[0] = sum_pixel[0] / pixels.length
      avg_pixel[1] = sum_pixel[1] / pixels.length
      avg_pixel[2] = sum_pixel[2] / pixels.length
      hex_color = Color::RGB.from_fraction(avg_pixel[0].to_f / 255, avg_pixel[1].to_f / 255, avg_pixel[2].to_f / 255).hex
      model.update_column("#{mounted_as}_color","##{hex_color}") if model.class.columns_hash.include?("#{mounted_as}_color")
      source
    end
  end

  def img_proxy_url(params = {})
    return nil if !present?
    key = [ENV['IMGPROXY_KEY']].pack("H*")
    salt = [ENV['IMGPROXY_SALT']].pack("H*")

    encoded_url = Base64.urlsafe_encode64(url).tr("=", "").scan(/.{1,16}/).join("/")

    resize_type = params[:resize_type] || "auto"
    width = params[:width] || 0
    height = params[:height] || 0
    # gravity = params[:gravity] || "no"
    enlarge = params[:enlarge] || 0
    extend = params[:extend] || 0
    extension = params[:extansion] || "jpg"
    dpr = params[:dpr] || 1
    quality = params[:q] || 90

    rs = ['rs', resize_type, width, height, enlarge, extend].compact.join(':')
    proxy_path = "#{rs}/dpr:#{dpr}/q:#{quality}/#{encoded_url}.#{extension}"

    digest = OpenSSL::Digest.new("sha256")

    hmac = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(digest, key, "#{salt}/#{proxy_path}")).tr("=", "")
    "#{ENV['IMG_PROXY_HOST']}/#{hmac}/#{proxy_path}"
  end

end
