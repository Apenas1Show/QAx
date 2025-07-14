import { test, expect } from "@playwright/test";

test('clicando no primeiro item da busca de imagens do Google', async ({ page }) => {
    await page.goto('https://www.google.com/imghp?hl=pt-BR&ogbl');

    const searchInput = page.locator('#APjFqb');
    await searchInput.fill('Expressões regulares css selector');
    await searchInput.press('Enter');

    const firstImage = page.locator('xpath=//div[@style="height:180px"]').first();
    await firstImage.click();
    await page.click('xpath=//div[@class="h11UTe"]/a');

    await page.waitForTimeout(3000); 
})