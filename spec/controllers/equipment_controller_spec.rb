require 'rails_helper'

RSpec.describe EquipmentController, type: :controller do
  describe 'GET #index ' do
    let!(:shield1) { create :shield }
    let!(:shield2) { create :shield }
    let!(:weapon1) { create :weapon }
    let!(:weapon2) { create :weapon }

    it 'assigns @equipment with Shield records' do
      get :index, params: { type: 'Shield' }
      expect(assigns(:equipment)).to match_array([shield1, shield2])
      expect(response).to render_template(:index)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @equipment with Weapon records' do
      get :index, params: { type: 'Weapon' }
      expect(assigns(:equipment)).to match_array([weapon1, weapon2])
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      equipment = create(:equipment)
      get :show, params: { id: equipment.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when creating a Weapon' do
      it 'creates a new Weapon' do
        post :create, params: { weapon: { name: 'Sword', attack_points: 10, defense_points: 5 } }
        expect(assigns(:equipment)).to be_a(Weapon)
        expect(assigns(:equipment)).to be_persisted
        expect(response).to redirect_to(assigns(:equipment))
      end
    end

    context 'when creating a Shield' do
      it 'creates a new Shield' do
        post :create, params: { shield: { name: 'Wooden Shield', defense_points: 15 } }
        expect(assigns(:equipment)).to be_a(Shield)
        expect(assigns(:equipment)).to be_persisted
        expect(response).to redirect_to(assigns(:equipment))
      end
    end

    context 'when creating generic Equipment' do
      it 'creates a new Equipment' do
        post :create, params: { equipment: { name: 'Generic Item', attack_points: 5, defense_points: 5 } }
        expect(assigns(:equipment)).to be_a(Equipment)
        expect(assigns(:equipment)).to be_persisted
        expect(response).to redirect_to(assigns(:equipment))
      end
    end
  end

  describe 'PUT #update' do
    let(:equipment) { create(:equipment, type: 'Weapon') }
    context 'with valid parameters' do
      it 'updates the equipment' do
        put :update, params: { id: equipment.id, weapon:{ name: 'Updated Sword', attack_points: 15, defense_points: 5 } }
        equipment.reload
        expect(equipment.name).to eq('Updated Sword')
        expect(response).to redirect_to("/weapons/#{equipment.id}")
      end
    end

    context 'with invalid parameters' do
      it 'does not update the equipment' do
        put :update, params: { id: equipment.id, weapon: { name: nil } }
        equipment.reload
        expect(equipment.name).not_to be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:equipment) { create(:equipment) }

    it 'destroys the equipment' do
      expect {
        delete :destroy, params: { id: equipment.id }
      }.to change(Equipment, :count).by(-1)
    end

    it 'redirects to the index page with a notice' do
      delete :destroy, params: { id: equipment.id }
      expect(response).to redirect_to(equipment_index_path(type: equipment.type))
      expect(flash[:notice]).to eq('equipement supprimer')
    end
  end
end
