import { test, expect } from "@playwright/test";

test('clicando no primeiro item da busca de imagens do Google', async ({ page }) => {
    await page.goto('https://www.google.com/imghp?hl=pt-BR&ogbl');

    const popUp = page.locator('#Sva75c')
    // Digitar "gatos" na barra de pesquisa
    const searchInput = page.locator('#APjFqb');
    await searchInput.fill('Expressões regulares css selector');
    await searchInput.press('Enter');

    // Esperar os resultados carregarem e clicar no primeiro item
    const firstImage = page.locator('xpath=//div[@style="height:180px"]').first();
    await firstImage.click();
    await page.click('xpath=//div[@class="h11UTe"]/a');

    await page.waitForTimeout(3000); // Esperar 2 segundos para garantir que a página carregou
    // // Verificar se a imagem foi aberta em uma nova aba
    // const [newPage] = await Promise.all([
    //     page.waitForSelector('#Sva75c'),
    //     firstImage.click()
    // ]);

    // // Verificar o título da nova página
    // await expect(newPage).toHaveTitle(/Expressões regulares css selector/);
})