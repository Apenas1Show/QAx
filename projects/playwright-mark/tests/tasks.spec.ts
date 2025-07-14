import {test, expect} from '@playwright/test'

test('deve poder cadastrar uma nova tarefa', async ({ page }) => {

    await page.goto('http://localhost:8080')
    
    await page.fill('input[class*="listInputNewTask"]', 'Ler um livro de typescript')
})