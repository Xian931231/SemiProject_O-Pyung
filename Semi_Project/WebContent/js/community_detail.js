const toggleBtn = document.querySelector('.card-footer-comment');
const menu = document.querySelector('.card-commentlist');
const search = document.querySelector('.card-footer');

toggleBtn.addEventListener('click',function(){
    
    menu.classList.toggle('active');
    search.classList.toggle('active');
});
