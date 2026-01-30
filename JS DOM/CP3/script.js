const menu = document.getElementById('menu');
const items = menu.querySelectorAll('.item');

items.forEach(item => {
    item.addEventListener('click', function(e) {
        e.stopPropagation();

        const submenu = this.querySelector('.submenu');
        const isLeaf = this.classList.contains('no-children');

        if (isLeaf) {
            const text = this.textContent.trim();
            console.log(`Переход по ссылке: ${text}`);
        } else if (submenu) {
            const isExpanded = this.classList.contains('expanded');
            
            if (isExpanded) {
                this.classList.remove('expanded');
                submenu.classList.remove('visible');
            } else {
                this.classList.add('expanded');
                submenu.classList.add('visible');
            }
        }
    });
});
