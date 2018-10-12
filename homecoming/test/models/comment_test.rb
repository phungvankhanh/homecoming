require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "all models" do
    @user = User.new(email: 'gminhcuong@gmail.com', password: 'xxx', nickname: 'MC')
    @user2 = User.new(email: 'thuuyen9x96@yahoo.com', password: 'yyy', nickname: 'Maruko')
    @destination = Destination.new(name: 'Sam Son', address: 'Thanh Hoa', speciality: 'Muc kho')
    @review = Review.new(title: 'Review about Sam Son Beach', destination: @destination, user: @user, rating: 3, content: 'Dia diem du lich noi tieng')
    @comment1 = Comment.new(user: @user, review: @review, content: 'Bai bien nay khong dep')
    @comment2 = Comment.new(user: @user2, review: @review, content: 'Ai bao bai bien nay khong dep', parent: @comment1)
    @comment3 = Comment.new(user: @user, review: @review, content: 'To bao la khong dep day', parent: @comment1)
    
    @user.save
    @user2.save
    @destination.save
    @review.save
    @comment1.save
    @comment2.save
    @comment3.save

    assert_not_equal(User.where(email: 'gminhcuong@gmail.com').first, nil)
    assert_not_equal(User.where(email: 'thuuyen9x96@yahoo.com').size, 0)
    assert_not_equal(Review.where(title: 'Review about Sam Son Beach').size, 0)
    assert_equal(Comment.where(parent: @comment1).size, 2)
  end
end
