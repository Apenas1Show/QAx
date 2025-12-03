import {test, expect} from '@playwright/test'

test('deve poder cadastrar uma nova tarefa pressionando o enter', async ({ page, request }) => {
    const taskName = 'Ler um livro de Playwright'
    await request.delete('http://localhost:3333/helper/tasks/' + taskName)

    await page.goto('http://localhost:8080')

    const inputNewTask = page.locator('input[class*="InputNewTask"]')
    await inputNewTask.fill(taskName)

    await page.click('css=button >> text="Create "') 
})

