var $star_ratings = $('.star-rating');

var SetRatingStar = function () {
    return $star_ratings.each(function () {
        $star_rating = $(this).children('.star-rating .fa')
        $rating_value = $(this).children('input.rating-value')
        $star_rating.each(function () {
            if (parseInt($rating_value.val()) >= parseInt($(this).data(
                    'rating'))) {
                return $(this).removeClass('fa-star-o').addClass('fa-star');
            } else {
                return $(this).removeClass('fa-star').addClass('fa-star-o');
            }
        });
    });
};
$('.star-rating').ready(function () {
    SetRatingStar();
});