var $star_ratings = $('.star-rating');

function SetRatingStar() {
    console.log("Chay cmnr begin 2");
    return $star_ratings.each(function () {
        console.log("Chay cmnr 1");
        $star_rating = $(this).children('.star-rating .fa')
        console.log("Chay cmnr 2");
        $rating_value = $(this).children('input.rating-value')
        console.log("Chay cmnr 3");
        $star_rating.each(function () {
            console.log("Chay cmnr 4");
            if (parseInt($rating_value.val()) >= parseInt($(this).data(
                    'rating'))) {
                        console.log("Chay cmnr 5");
                return $(this).removeClass('fa-star-o').addClass('fa-star');
            } else {
                console.log("Chay cmnr 6");
                return $(this).removeClass('fa-star').addClass('fa-star-o');
            }
            console.log("Chay cmnr end");
        });
    });
};
$('.star-rating').ready(function () {
    console.log("Begin");
    SetRatingStar();
    console.log($star_ratings);
});