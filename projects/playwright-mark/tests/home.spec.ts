import {test, expect} from '@playwright/test'

test('webapp deve estar online', async ({page})=> {
    await page.goto('http://192.168.161.1:8080') // abra a página 'link da página'
    await expect(page).toHaveTitle('Gerencie suas tarefas com Mark L') // que o titulo do HTML seja Gerencie suas tarefas com Mark L
    await (page).waitForTimeout(3000) // aguarde carregar 3 segundos
})

