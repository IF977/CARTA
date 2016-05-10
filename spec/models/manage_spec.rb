require 'rails_helper' 
RSpec.describe Manage, :type => :model do
    
    it "its OK when name, price, ingredient and pictures attributes exists" do 
    prato = Manage.new( name: 'Filé', 
    price: 'R$ 100,00', 
    ingredient: 'carne' ) 
   
   expect(prato).to be_valid 
  end 
  
    it "is invalid when havent a name" do
        prato = Manage.new(name: nil) 
        expect(prato).to be_invalid
 end 
    
    it "is invalid when name already exists in database, name have to be unique" do
        prato = Manage.create( name: 'porco', price: 'R$100,00', ingredient: 'feijão' ) 
        prato = Manage.new( name: 'porco', price: 'R$80,00', ingredient: 'arroz' ) 
        expect(prato).to be_invalid
 end 
    
      it "is invalid when name length is greater than 50" do
        prato = Manage.new(name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price:'R$80,00', ingredient: 'abc') 
        expect(prato).to be_invalid
 end 
    
    it "is invalid when price length is greater than 10" do
        prato = Manage.new(name: "ave", price: "aaaaaaaaaaa", ingredient: 'abcd') 
        expect(prato).to be_invalid
 end 
 
 it "is invalid when ingredient length is greater than 200" do
        prato = Manage.new(name: "boi", ingredient: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price:'R$89,00') 
        expect(prato).to be_invalid
 end 
    
        
 
end