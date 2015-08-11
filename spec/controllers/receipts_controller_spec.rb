require 'spec_helper'

module Admin
  describe ReceiptsController, type: :controller do
    before { logged_in(:user) }

    describe 'GET /paid_fees' do

      it 'should respond with current month fees heads' do
        student = create(:student)

        receipt1 = create(:receipt, student: student, date: Date.parse("20/02/2015"))
        receipt1.fees_heads << (fees_head11 = create(:fees_head))
        receipt1.fees_heads << (fees_head12 = create(:fees_head))

        receipt2 = create(:receipt, student: student, date: Date.parse("21/03/2015"))
        receipt2.fees_heads << (fees_head21 = create(:fees_head))

        get :paid_fees, student_id: student.id, date: '23/02/2015'
        collection = JSON.parse(response.body)
        expect(collection.size).to eq(2)
        ids = collection.map { |a| a['id'] }
        expect(ids).to include(fees_head11.id)
        expect(ids).to include(fees_head12.id)

        get :paid_fees, student_id: student.id, date: '23/03/2015'
        collection = JSON.parse(response.body)
        expect(collection.size).to eq(1)
        ids = collection.map { |a| a['id'] }
        expect(ids).to include(fees_head21.id)

        get :paid_fees, student_id: student.id, date: '23/04/2015'
        collection = JSON.parse(response.body)
        expect(collection.size).to eq(0)
      end

      it 'should return only fees heads for receipts non cancelled' do
        student = create(:student)

        receipt1 = create(:receipt, student: student, date: Date.parse("20/02/2015"))
        receipt1.fees_heads << (fees_head11 = create(:fees_head))
        receipt1.fees_heads << (fees_head12 = create(:fees_head))

        receipt2 = create(:receipt, student: student, date: Date.parse("20/02/2015"))
        receipt2.fees_heads << (fees_head21 = create(:fees_head))

        get :paid_fees, student_id: student.id, date: '20/02/2015'
        collection = JSON.parse(response.body)
        expect(collection.size).to eq(3)
        ids = collection.map { |a| a['id'] }
        expect(ids).to include(fees_head11.id)
        expect(ids).to include(fees_head12.id)
        expect(ids).to include(fees_head21.id)

        receipt1.update_attributes!(status: "cancelled")

        get :paid_fees, student_id: student.id, date: '20/02/2015'
        collection = JSON.parse(response.body)
        expect(collection.size).to eq(1)
        ids = collection.map { |a| a['id'] }
        expect(ids).to include(fees_head21.id)
      end
    end
  end
end
