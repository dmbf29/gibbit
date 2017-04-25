class AddPaymentToInquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :payment, :json
  end
end
