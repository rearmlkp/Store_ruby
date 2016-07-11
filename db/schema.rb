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

  create_table "Order", primary_key: "idOrder", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idPaymentType",             null: false
    t.datetime "OrderDate",                 null: false
    t.integer  "OrderStatus",   default: 0, null: false
    t.string   "uid",                       null: false
    t.index ["idPaymentType"], name: "fk_Order_PaymentType1_idx", using: :btree
    t.index ["uid"], name: "fk_Order_User1_idx", using: :btree
  end

  create_table "OrderLine", primary_key: ["idOrder", "idProduct"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idOrder",        null: false
    t.integer "idProduct",      null: false
    t.integer "idSpecialOffer", null: false
    t.integer "Quantity",       null: false
    t.index ["idOrder"], name: "fk_Order_has_Product_Order1_idx", using: :btree
    t.index ["idProduct"], name: "fk_Order_has_Product_Product1_idx", using: :btree
    t.index ["idSpecialOffer"], name: "fk_OrderLine_SpecialOffer1_idx", using: :btree
  end

  create_table "PaymentType", primary_key: "idPaymentType", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TypeName",    limit: 45, null: false
    t.string "Description"
  end

  create_table "Product", primary_key: "idProduct", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idProductType",            null: false
    t.string  "ProductName",              null: false
    t.string  "Description"
    t.integer "StockQuantity",            null: false
    t.string  "ImagePath"
    t.float   "Price",         limit: 24, null: false
    t.index ["idProductType"], name: "fk_Product_ProductType_idx", using: :btree
  end

  create_table "ProductType", primary_key: "idProductType", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TypeName",    null: false
    t.string "Description"
  end

  create_table "ReparingProduct", primary_key: "idReparingProduct", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "SoldProduct", primary_key: "idSoldProduct", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "SpecialOffer", primary_key: "idSpecialOffer", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "OfferName",   null: false
    t.string "Description"
  end

  create_table "User", primary_key: "uid", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Users and global privileges" do |t|
    t.string "Name",     limit: 45, null: false
    t.string "Address"
    t.string "Provider",            null: false
  end

  create_table "UserComment", primary_key: ["idProduct", "uid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idProduct",                                      null: false
    t.string   "Comment",                                        null: false
    t.datetime "AddTime",   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "uid",                                            null: false
    t.index ["idProduct"], name: "fk_User_has_Product_Product1_idx", using: :btree
    t.index ["uid"], name: "fk_UserComment_User1_idx", using: :btree
  end

  add_foreign_key "Order", "PaymentType", column: "idPaymentType", primary_key: "idPaymentType", name: "fk_Order_PaymentType1", on_delete: :cascade
  add_foreign_key "Order", "User", column: "uid", primary_key: "uid", name: "fk_Order_User1"
  add_foreign_key "OrderLine", "Order", column: "idOrder", primary_key: "idOrder", name: "fk_Order_has_Product_Order1", on_delete: :cascade
  add_foreign_key "OrderLine", "Product", column: "idProduct", primary_key: "idProduct", name: "fk_Order_has_Product_Product1", on_delete: :cascade
  add_foreign_key "OrderLine", "SpecialOffer", column: "idSpecialOffer", primary_key: "idSpecialOffer", name: "fk_OrderLine_SpecialOffer1", on_delete: :cascade
  add_foreign_key "Product", "ProductType", column: "idProductType", primary_key: "idProductType", name: "fk_Product_ProductType"
  add_foreign_key "ReparingProduct", "ProductType", column: "idProductType", primary_key: "idProductType", name: "fk_PendingProduct_ProductType1"
  add_foreign_key "ReparingProduct", "User", column: "uid", primary_key: "uid", name: "fk_ReparingProduct_User1"
  add_foreign_key "SoldProduct", "ProductType", column: "idProductType", primary_key: "idProductType", name: "fk_PendingProduct_ProductType2"
  add_foreign_key "SoldProduct", "User", column: "uid", primary_key: "uid", name: "fk_SoldProduct_User1"
  add_foreign_key "UserComment", "Product", column: "idProduct", primary_key: "idProduct", name: "fk_User_has_Product_Product1"
  add_foreign_key "UserComment", "User", column: "uid", primary_key: "uid", name: "fk_UserComment_User1"
end
