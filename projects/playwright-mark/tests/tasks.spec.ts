import {test, expect} from '@playwright/test'

test('deve poder cadastrar uma nova tarefa pressionando o enter', async ({ page }) => {

    await page.goto('http://localhost:8080')

    const inputNewTask = page.locator('input[class*="InputNewTask"]') // usado para controlar locators e ter um acesso mais rápido no futuro
    await inputNewTask.fill('Ler um livro de typescript')
    await inputNewTask.press('Enter') // pressionar o botão enter para validar se funciona criar a task assim

    await page.click('button[class*="listButtonNewTask"]') // clicar no botão de adicionar tarefa pela classe do botão que contenha
    await page.click('xpath=//button[contains(text(), "Create")]') // clicar no botão de criar tarefa via botão que contem o texto Create
   
    await page.click('css=button >> text=Create')// clicar no botão de criar tarefa via botão que contem o texto Create usando css selector 
})

test('deve poder cadastrar uma nova tarefa clicar no botao Create com xpath', async ({page}) => {
    await page.goto('http://localhost:8080')

    const inputNewTask = page.locator('input[class*="InputNewTask"]')
    await inputNewTask.fill('Ler um livro de typescript')
    await page.click('xpath=//button[contains(text(), "Create")]')
})

test('deve poder cadastrar uma nova tarefa clicar no botao Create com css selector', async ({page}) => {
    await page.goto('http://localhost:8080')

    const inputNewTask = page.locator('input[class*="InputNewTask"]')
    await inputNewTask.fill('Ler um livro de typescript')
    await page.click('css=button >> text=Create')
})
