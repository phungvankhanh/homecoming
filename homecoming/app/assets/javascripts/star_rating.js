var $star_rating = $('.star-rating .fa');
var $type = $('.type');

var SetRatingStar = function() {
  return $star_rating.each(function() {
    switch(parseInt($star_rating.siblings('input.rating-value').val())) {
      case 0:
          $text = 'worse';
          break;
      case 1:
          $text = 'very bad';
          break;
      case 2:
          $text = 'bad';
          break;
      case 3:
          $text = 'average';
          break;
      case 4:
          $text = 'good';
          break;
      default:
        $text = 'very good'
  }
    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
      $type.text($text);
      return $(this).removeClass('fa-star-o').addClass('fa-star');
    } else {
      $type.text($text);
      return $(this).removeClass('fa-star').addClass('fa-star-o');
    }
  });
};

$star_rating.on('click', function() {
  if($(this).data('rating')==1 && $(this).hasClass('fa-star')){
    $(this).removeClass('fa-star').addClass('fa-star-o');
    $star_rating.siblings('input.rating-value').val(0);
  }
  else 
    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
  return SetRatingStar();
});

SetRatingStar();
$(document).ready(function() {

});