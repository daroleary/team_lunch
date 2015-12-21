require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrdersController, type: :controller do

  let(:order) { create(:order) }

  describe '#index' do
    it 'assigns all orders as @orders' do
      get :index

      expect(response.status).to eql(200)
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe '#show' do
    it 'assigns the requested order as @order' do
      get :show, {:id => order.id}

      expect(response.status).to eql(200)
      expect(assigns(:order)).to eq(order)
    end
  end

  describe '#new' do
    it 'assigns a new order as @order' do
      get :new

      expect(response.status).to eql(200)
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe '#edit' do
    it 'assigns the requested order as @order' do
      get :edit, {:id => order.id}

      expect(response.status).to eql(200)
      expect(assigns(:order)).to eq(order)
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates a new Order' do
        post :create, {:order => build(:order).as_json}

        expect(response.status).to eql(302)
        expect(assigns(:order)).to be_a(Order)
        expect(Order.count).to eql(1)
        expect(response).to redirect_to(Order.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved order as @order' do
        new_order = build(:order)
        new_order.order_date = nil

        post :create, {:order => new_order.as_json}

        expect(response.status).to eql(200)
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        new_order = build(:order)
        new_order.order_date = nil

        post :create, {:order => new_order.as_json}

        expect(response.status).to eql(200)
        expect(response).to render_template("new")
      end
    end
  end

  describe "#update" do
    context 'with valid params' do
      it 'updates the requested order' do
        order.order_date = Date.tomorrow
        put :update, {:id => order.id, :order => order.as_json}

        expect(response.status).to eql(302)
        expect(response).to redirect_to(order)
        expect(assigns(:order)).to eq(order)
        expect(order.reload.order_date.to_date).to eql(Date.tomorrow)
      end
    end

    context 'with invalid params' do
      it 'assigns the order as @order' do
        order.order_date = Date.yesterday
        put :update, {:id => order.id, :order => order.as_json}

        expect(assigns(:order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        order.order_date = Date.yesterday

        put :update, {:id => order.id, :order => order.as_json}
        expect(response).to render_template("edit")
      end
    end
  end

  describe '#destroy' do
    it 'destroys the requested order' do
      delete :destroy, {:id => order.id}

      expect(Order.where(id: order.id).first).to be_nil
    end

    it 'redirects to the orders list' do
      delete :destroy, {:id => order.id}

      expect(response.status).to eql(302)
      expect(response).to redirect_to(orders_url)
    end
  end

end