require_dependency "blogelator/admin/application_controller"

module Blogelator
  module Admin
    class ImagesController < ApplicationController
      respond_to :json

      # POST /api/images
      def create
        if s3_bucket
          file = params[:file]
          s3_object = s3_bucket.objects.create(file.original_filename, file.tempfile, acl: :public_read)
          render json: { filename: s3_object.public_url.to_s }
        else
          throw Exception, "S3 not setup"
        end
      end

    private

      def authorize_user
        authorize! :manage, Blogelator::Post
      end

      def s3_bucket
        return unless Blogelator.s3_access_key_id && Blogelator.s3_secret_access_key && Blogelator.s3_bucket
        s3 = AWS::S3.new(
          access_key_id:     Blogelator.s3_access_key_id,
          secret_access_key: Blogelator.s3_secret_access_key
        )
        s3.buckets[Blogelator.s3_bucket]
      end
    end
  end
end
