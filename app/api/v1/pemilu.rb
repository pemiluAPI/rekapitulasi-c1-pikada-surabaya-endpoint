module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :kecamatan do
      desc "Return all rekapitulasi based on kecamatan"
      get do
        rekapitulasi = Array.new

        # Prepare conditions based on params
        valid_params = {
          kecamatan: 'nama'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Kecamatan.includes(:rekapitulasis)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |kecamatan|

            rekapitulasi << {
              id: kecamatan.id,
              nama: kecamatan.nama,
              pemilih: kecamatan.rekapitulasis.first.pemilih,
              pengguna_hak_pilih: kecamatan.rekapitulasis.first.pengguna_hak_pilih,
              perolehan_suara_1: kecamatan.rekapitulasis.first.perolehan_suara_1,
              perolehan_suara_2: kecamatan.rekapitulasis.first.perolehan_suara_2,
              suara_sah: kecamatan.rekapitulasis.first.suara_sah,
              suara_tidak_sah: kecamatan.rekapitulasis.first.suara_tidak_sah,
              total_suara: kecamatan.rekapitulasis.first.total_suara,
              data_masuk: kecamatan.rekapitulasis.first.data_masuk
            }
          end

        {
          results: {
            count: rekapitulasi.count,
            total: Kecamatan.where(conditions).count,
            rekapitulasi: rekapitulasi
          }
        }
      end
    end

    resource :kelurahan do
      desc "Return all rekapitulasi based on kelurahan"
      get do
        rekapitulasi = Array.new

        # Prepare conditions based on params
        valid_params = {
          kelurahan: 'nama',
          kecamatan: 'kecamatan_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Kelurahan.includes(:rekapitulasis)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |kelurahan|

            rekapitulasi << {
              id: kelurahan.id,
              kecamatan: {
                id: kelurahan.kecamatan_id,
                nama: kelurahan.kecamatan.nama
              },
              nama: kelurahan.nama,
              pemilih: kelurahan.rekapitulasis.first.pemilih,
              pengguna_hak_pilih: kelurahan.rekapitulasis.first.pengguna_hak_pilih,
              perolehan_suara_1: kelurahan.rekapitulasis.first.perolehan_suara_1,
              perolehan_suara_2: kelurahan.rekapitulasis.first.perolehan_suara_2,
              suara_sah: kelurahan.rekapitulasis.first.suara_sah,
              suara_tidak_sah: kelurahan.rekapitulasis.first.suara_tidak_sah,
              total_suara: kelurahan.rekapitulasis.first.total_suara,
              data_masuk: kelurahan.rekapitulasis.first.data_masuk
            }
          end

        {
          results: {
            count: rekapitulasi.count,
            total: Kelurahan.where(conditions).count,
            rekapitulasi: rekapitulasi
          }
        }
      end
    end

    resource :tps do
      desc "Return all rekapitulasi based on tps"
      get do
        rekapitulasi = Array.new

        # Prepare conditions based on params
        valid_params = {
          tps: 'nama',
          kelurahan: 'kelurahan_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Tps.includes(:rekapitulasis)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |tps|

            rekapitulasi << {
              id: tps.id,
              kecamatan: {
                id: tps.kelurahan.kecamatan_id,
                nama: tps.kelurahan.kecamatan.nama
              },
              kelurahan: {
                id: tps.kelurahan_id,
                nama: tps.kelurahan.nama
              },
              nama: tps.nama,
              pemilih: tps.rekapitulasis.first.pemilih,
              pengguna_hak_pilih: tps.rekapitulasis.first.pengguna_hak_pilih,
              perolehan_suara_1: tps.rekapitulasis.first.perolehan_suara_1,
              perolehan_suara_2: tps.rekapitulasis.first.perolehan_suara_2,
              suara_sah: tps.rekapitulasis.first.suara_sah,
              suara_tidak_sah: tps.rekapitulasis.first.suara_tidak_sah,
              total_suara: tps.rekapitulasis.first.total_suara,
              data_masuk: tps.rekapitulasis.first.data_masuk
            }
          end

        {
          results: {
            count: rekapitulasi.count,
            total: Tps.where(conditions).count,
            rekapitulasi: rekapitulasi
          }
        }
      end
    end
  end
end