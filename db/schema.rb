# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "OrderLines", primary_key: ["idOrder", "idProduct"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idOrder",        null: false
    t.integer "idProduct",      null: false
    t.integer "idSpecialOffer", null: false
    t.integer "Quantity",       null: false
    t.index ["idOrder"], name: "fk_Order_has_Product_Order1_idx", using: :btree
    t.index ["idProduct"], name: "fk_Order_has_Product_Product1_idx", using: :btree
    t.index ["idSpecialOffer"], name: "fk_OrderLine_SpecialOffer1_idx", using: :btree
  end

  create_table "Orders", primary_key: "idOrder", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idPaymentType",             null: false
    t.datetime "OrderDate",                 null: false
    t.integer  "OrderStatus",   default: 0, null: false
    t.string   "uid",                       null: false
    t.index ["idPaymentType"], name: "fk_Order_PaymentType1_idx", using: :btree
    t.index ["uid"], name: "fk_Order_User1_idx", using: :btree
  end

  create_table "PaymentTypes", primary_key: "idPaymentType", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TypeName",    limit: 45, null: false
    t.string "Description"
  end

  create_table "ProductTypes", primary_key: "idProductType", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TypeName",    null: false
    t.string "Description"
  end

  create_table "Products", primary_key: "idProduct", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idProductType",            null: false
    t.string  "ProductName",              null: false
    t.string  "Description"
    t.integer "StockQuantity",            null: false
    t.string  "ImagePath"
    t.float   "Price",         limit: 24, null: false
    t.index ["idProductType"], name: "fk_Product_ProductType_idx", using: :btree
  end

  create_table "ReparingProducts", primary_key: "idReparingProduct", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idProductType",                                                 null: false
    t.string   "Name",                                                          null: false
    t.string   "Description"
    t.string   "ImagePath"
    t.integer  "Status",                   default: 0,                          null: false
    t.float    "RepairedPrice", limit: 24, default: 0.0,                        null: false
    t.datetime "RepairedDate",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "uid",                                                           null: false
    t.index ["idProductType"], name: "fk_PendingProduct_ProductType1_idx", using: :btree
    t.index ["uid"], name: "fk_ReparingProduct_User1_idx", using: :btree
  end

  create_table "SoldProducts", primary_key: "idSoldProduct", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idProductType",                                                 null: false
    t.string   "Name",                                                          null: false
    t.string   "Description"
    t.string   "ImagePath"
    t.float    "SoldPrice",     limit: 24, default: 0.0,                        null: false
    t.datetime "SoldDate",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "uid",                                                           null: false
    t.index ["idProductType"], name: "fk_PendingProduct_ProductType2_idx", using: :btree
    t.index ["uid"], name: "fk_SoldProduct_User1_idx", using: :btree
  end

  create_table "SpecialOffers", primary_key: "idSpecialOffer", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "OfferName",   null: false
    t.string "Description"
  end

  create_table "UserComments", primary_key: ["idProduct", "uid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idProduct",                                      null: false
    t.string   "Comment",                                        null: false
    t.datetime "AddTime",   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "uid",                                            null: false
    t.index ["idProduct"], name: "fk_User_has_Product_Product1_idx", using: :btree
    t.index ["uid"], name: "fk_UserComment_User1_idx", using: :btree
  end

  create_table "Users", primary_key: "uid", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "Name",     limit: 45, null: false
    t.string "Address"
    t.string "Provider",            null: false
    t.index ["uid", "Provider", "Name"], name: "SearchIndex", using: :btree
  end

  add_foreign_key "OrderLines", "Orders", column: "idOrder", primary_key: "idOrder", name: "fk_Order_has_Product_Order1", on_delete: :cascade
  add_foreign_key "OrderLines", "Products", column: "idProduct", primary_key: "idProduct", name: "fk_Order_has_Product_Product1", on_delete: :cascade
  add_foreign_key "OrderLines", "SpecialOffers", column: "idSpecialOffer", primary_key: "idSpecialOffer", name: "fk_OrderLine_SpecialOffer1", on_delete: :cascade
  add_foreign_key "Orders", "PaymentTypes", column: "idPaymentType", primary_key: "idPaymentType", name: "fk_Order_PaymentType1", on_delete: :cascade
  add_foreign_key "Orders", "Users", column: "uid", primary_key: "uid", name: "fk_Order_User1"
  add_foreign_key "Products", "ProductTypes", column: "idProductType", primary_key: "idProductType", name: "fk_Product_ProductType"
  add_foreign_key "ReparingProducts", "ProductTypes", column: "idProductType", primary_key: "idProductType", name: "fk_PendingProduct_ProductType1"
  add_foreign_key "ReparingProducts", "Users", column: "uid", primary_key: "uid", name: "fk_ReparingProduct_User1"
  add_foreign_key "SoldProducts", "ProductTypes", column: "idProductType", primary_key: "idProductType", name: "fk_PendingProduct_ProductType2"
  add_foreign_key "SoldProducts", "Users", column: "uid", primary_key: "uid", name: "fk_SoldProduct_User1"
  add_foreign_key "UserComments", "Products", column: "idProduct", primary_key: "idProduct", name: "fk_User_has_Product_Product1"
  add_foreign_key "UserComments", "Users", column: "uid", primary_key: "uid", name: "fk_UserComment_User1"
end
