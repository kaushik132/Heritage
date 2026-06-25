AOS.init({ duration: 800, once: true });



// Hero Slider
new Swiper('.hero-swiper', {
  loop: true,
  autoplay: {
    delay: 4000,
    disableOnInteraction: false
  },
  pagination: {
    el: '.swiper-pagination',
    clickable: true
  },
  effect: 'fade',
  fadeEffect: {
    crossFade: true
  },
  speed: 800,
});

// Retail Category Slider
new Swiper('.retail-swiper', {
  slidesPerView: 1.3,
  spaceBetween: 20,
  freeMode: true,
  breakpoints: {
    640: {
      slidesPerView: 2.3
    },
    768: {
      slidesPerView: 3.3
    },
    1024: {
      slidesPerView: 6
    },
  }
});

// Wholesale Category Slider
new Swiper('.wholesale-swiper', {
  slidesPerView: 1.3,
  spaceBetween: 20,
  freeMode: true,
  breakpoints: {
    640: {
      slidesPerView: 2.3
    },
    768: {
      slidesPerView: 3.3
    },
    1024: {
      slidesPerView: 6
    },
  }
});


//   testimonials slider 

new Swiper('.testimonial-swiper', {
  slidesPerView: 1,
  spaceBetween: 16,
  navigation: {
    nextEl: '.testimonial-next',
    prevEl: '.testimonial-prev',
  },
  breakpoints: {
    640: { slidesPerView: 2 },
    1024: { slidesPerView: 4 },
  }
});


// Swiper init
const thumbSwiperEl = new Swiper('.product-thumb-swiper', {
  spaceBetween: 10,
  slidesPerView: 'auto',
  freeMode: true,
  watchSlidesProgress: true,
});
const mainSwiperEl = new Swiper('.product-main-swiper', {
  spaceBetween: 0,
  effect: 'fade',
  fadeEffect: { crossFade: true },
  thumbs: { swiper: thumbSwiperEl },
});

// Global zoom elements
const globalResult = document.getElementById('globalZoomResult');
const globalImg = document.getElementById('globalZoomImg');
const ZOOM = 3;

document.querySelectorAll('.zoom-wrap').forEach(wrap => {
  const img = wrap.querySelector('.zoom-img');
  const lens = wrap.querySelector('.zoom-lens');

  img.addEventListener('mouseenter', () => {
    lens.style.display = 'block';
    globalResult.style.display = 'block';
    globalImg.src = img.src;
    globalImg.style.width = img.offsetWidth * ZOOM + 'px';
    globalImg.style.height = img.offsetHeight * ZOOM + 'px';
  });

  img.addEventListener('mouseleave', () => {
    lens.style.display = 'none';
    globalResult.style.display = 'none';
  });

  img.addEventListener('mousemove', (e) => {
    const rect = img.getBoundingClientRect();
    let x = e.clientX - rect.left;
    let y = e.clientY - rect.top;

    const lw = lens.offsetWidth / 2;
    const lh = lens.offsetHeight / 2;

    x = Math.max(lw, Math.min(x, img.offsetWidth - lw));
    y = Math.max(lh, Math.min(y, img.offsetHeight - lh));

    // Lens on image
    lens.style.left = (x - lw) + 'px';
    lens.style.top = (y - lh) + 'px';

    // ✅ Fixed — cursor ke right side
    globalResult.style.left = (e.clientX + 24) + 'px';
    globalResult.style.top = (e.clientY - 160) + 'px';

    // Zoomed image position
    const zx = (x * ZOOM) - (globalResult.offsetWidth / 2);
    const zy = (y * ZOOM) - (globalResult.offsetHeight / 2);
    globalImg.style.transform = `translate(${-zx}px, ${-zy}px)`;
  });
});

// Color select
function selectColor(el) {
  document.querySelectorAll('.color-btn').forEach(b => {
    b.classList.remove('bg-primary', 'text-white', 'border-primary');
    b.classList.add('border-[#D6D6D6]', 'text-primary');
  });
  el.classList.add('bg-primary', 'text-white', 'border-primary');
  el.classList.remove('border-[#D6D6D6]');
}

// Quantity
function chQty(d) {
  let q = parseInt(document.getElementById('qty').innerText);
  document.getElementById('qty').innerText = Math.max(1, q + d);
}

// related product slider 

new Swiper('.rec-swiper', {
  slidesPerView: 1.2,
  spaceBetween: 16,
  navigation: {
    nextEl: '.rec-next',
    prevEl: '.rec-prev',
  },
  breakpoints: {
    480: { slidesPerView: 2, spaceBetween: 16 },
    768: { slidesPerView: 2.5, spaceBetween: 16 },
    1024: { slidesPerView: 4, spaceBetween: 20 },
  }
});


// BULK ENQUIRY MODAL BOX JS 

function openModal(id) {
  document.getElementById(id).style.display = 'flex';
  document.body.style.overflow = 'hidden';
}

function closeModal(id) {
  document.getElementById(id).style.display = 'none';
  document.body.style.overflow = '';
}

// Backdrop click se band
document.addEventListener('click', function (e) {
  if (e.target.classList.contains('modal-backdrop')) {
    closeModal(e.target.id);
  }
});

// ESC se band
document.addEventListener('keydown', function (e) {
  if (e.key === 'Escape') {
    document.querySelectorAll('.modal-backdrop').forEach(m => {
      if (m.style.display === 'flex') closeModal(m.id);
    });
  }
});



// whishlist page js 


function removeWishItem(btn) {
  const card = btn.closest('.wishlist-card');
  card.remove();
  updateCount();
  checkEmpty();
}

function clearWishlist() {
  document.querySelectorAll('.wishlist-card').forEach(c => c.remove());
  checkEmpty();
}

function updateCount() {
  const count = document.querySelectorAll('.wishlist-card').length;
  document.querySelector('h1').textContent = `My Wishlist (${count} Items)`;
}

function checkEmpty() {
  const count = document.querySelectorAll('.wishlist-card').length;
  updateCount();
  if (count === 0) {
    document.getElementById('emptyWishlist').classList.remove('hidden');
    document.getElementById('emptyWishlist').classList.add('flex');
  }
}


// whishlist button js
function toggleWishlist(el) {
  const icon = el.querySelector('.wish-icon');
  const text = el.querySelector('.wish-text');
  const isWishlisted = text.textContent === 'Wishlisted';

  if (isWishlisted) {
    // Remove from wishlist
    icon.classList.remove('fill-red-500', 'stroke-red-500');
    icon.classList.add('fill-none', 'stroke-current');
    text.textContent = 'Wishlist';
  } else {
    // Add to wishlist — phir redirect
    icon.classList.add('fill-red-500', 'stroke-red-500');
    icon.classList.remove('fill-none', 'stroke-current');
    text.textContent = 'Wishlisted';

    // 1 second baad redirect
    setTimeout(() => {
      window.location.href = 'whishlist.php';
    }, 800);
  }
}