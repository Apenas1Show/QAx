import {test, expect} from '@playwright/test';

test ('deve abrir duas abas e interagir com elas', async ({page}) => {
    await page.goto('https://www.google.com/imghp?hl=pt-BR&ogbl');

    const searchInput = page.locator('#APjFqb');
    const firstProduct = page.locator('.top-pla-group-inner a[data-impdclcc="1"]').first();
    
    await searchInput.fill('bola de futebol');
    await searchInput.press('Enter');


    const newPagePromise = page.context().waitForEvent('page'); // recebe o contexto da página para esperar por uma nova aba
    await firstProduct.click() 
    const newPage = await newPagePromise; // Espera pela nova aba ser aberta
    
    const tituloNovaAba = await newPage.locator('title').textContent(); // Obtém o título da nova aba
    console.log('Título do produto na nova aba:', tituloNovaAba);
})