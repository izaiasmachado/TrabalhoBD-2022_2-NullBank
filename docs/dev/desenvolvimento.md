# Informações sobre o Desenvolvimento

Esse arquivo está aqui para armazenar informações úteis para o desenvolvimento do projeto. Ele não é obrigatório para o uso do projeto, mas pode ser útil para contribuir com o projeto.

## Instruções Iniciar MySQL

Para iniciar o MySQL, execute o seguinte comando:

```bash
docker-compose up -d
```

Caso seja necessário parar o MySQL, execute o seguinte comando:

```bash
docker-compose down
```

## Instruções Iniciar o Servidor

Para instalar o backend da aplicação, execute o seguinte comando:

```bash
cd src/server
npm install
co .env.example .env
```

Para iniciar o servidor, execute o seguinte comando:

```bash
npm start
```

## Logo

```html
<div style="background-color: purple; padding: 10px; display: inline-block">
  <svg width="323" height="95" viewBox="0 0 323 95" class="css-1j8o68f">
    <defs id="SvgjsDefs1298"></defs>
    <g
      id="SvgjsG1299"
      featurekey="symbolContainer"
      transform="matrix(1,0,0,1,0,0)"
      fill="#ffffff"
    >
      <path
        xmlns="http://www.w3.org/2000/svg"
        fill-rule="nonzero"
        d=" M0,0 H103 V95 H0,0 z M4,4 v87 h95 v-87 z "
      ></path>
    </g>
    <g
      id="SvgjsG1300"
      featurekey="symbolFeature-0"
      transform="matrix(0.9615386227682969,0,0,0.9615386227682969,445.2692967122334,-424.75006183164186)"
      fill="#ffffff"
    >
      <polygon
        xmlns="http://www.w3.org/2000/svg"
        points="-382.3,490.2 -384.7,492.5 -372.6,497.1 -377.3,485.1 -380.2,488 -398,470.5 -415.1,487 -443.2,456.3 -445.4,458.3 -415.2,491.3 -398.1,474.7 "
      ></polygon>
      <path
        xmlns="http://www.w3.org/2000/svg"
        d="M-444.8,525.7h12.1v-41.2l-12.1-13.2V525.7z M-443.8,473.8l10.1,11v39.9h-10.1V473.8z"
      ></path>
      <path
        xmlns="http://www.w3.org/2000/svg"
        d="M-427.5,525.7h12.1v-22.4l-12.1-13.2V525.7z M-426.5,492.7l10.1,11v21h-10.1V492.7z"
      ></path>
      <path
        xmlns="http://www.w3.org/2000/svg"
        d="M-410.2,525.7h12.2V487l-12.2,11.8V525.7z M-409.2,499.2l10.2-9.8v35.3h-10.2V499.2z"
      ></path>
      <path
        xmlns="http://www.w3.org/2000/svg"
        d="M-392.9,525.7h12.1v-21.6l-12.1-12V525.7z M-391.9,494.5l10.1,10v20.2h-10.1V494.5z"
      ></path>
    </g>
    <g
      id="SvgjsG1301"
      featurekey="nameFeature-0"
      transform="matrix(1.131733906107842,0,0,1.131733906107842,121.18922558833162,20.086010723461968)"
      fill="#ffffff"
    >
      <path
        d="M1.64 17.04 c0 7.52 -0.04 15.04 -0.04 22.6 l0 0.36 l6.48 0 l0 -11.84 c0 -2.88 2.52 -5.4 5.6 -5.4 c2.96 0 5.28 2.28 5.6 5 c0.04 0.4 0 0.84 0 1.24 l0.04 2.92 l0 8 l6.48 0.08 l0 -12.04 c0 -2.92 -1.48 -5.8 -3.6 -7.84 c-2.32 -2.24 -5.16 -3.44 -8.52 -3.44 c-2 0 -3.92 0.44 -5.68 1.32 l0 -1.2 l-6.36 0 l0 0.24 z M32.120000000000005 36.72 c2.28 2.44 5.36 3.28 8.72 3.28 c1.8 0 3.68 -0.28 5.36 -1 l0 1 l6.48 0 l0 -23.2 l-7.12 0 l0 11.2 c0 3.12 -1.32 5.16 -4.72 5.16 c-3.44 0 -4.68 -2.08 -4.68 -5.16 l0 -11.2 l-7.16 0 l0 11.56 c0 3.08 0.88 6 3.12 8.36 z M55.88 40.04 l6.48 0 l-0.08 -31.28 l-6.36 0 l0 0.4 z M65.56 40.04 l6.48 0 l-0.08 -31.28 l-6.36 0 l0 0.4 z M75.28 40 l6.48 0 l0 -1.28 c1.72 0.84 3.6 1.24 5.56 1.24 c6.8 0 12.12 -5.4 12.12 -11.68 c0 -6.24 -5.32 -11.64 -12.12 -11.64 c-2 0 -3.92 0.44 -5.68 1.32 l0 -9.2 l-6.36 0 l0 0.4 c0 6.36 -0.04 12.76 -0.04 19.12 c0 3.8 0.04 7.56 0.04 11.36 l0 0.36 z M92.96000000000001 28.28 c0 2.96 -2.44 5.6 -5.64 5.6 c-1.56 0 -2.88 -0.56 -3.96 -1.6 c-0.8 -0.8 -1.6 -2.24 -1.6 -3.28 l0 -1.4 c0 -1.04 0.8 -2.44 1.6 -3.24 c1.08 -1.04 2.4 -1.64 3.96 -1.64 c3.2 0 5.64 2.64 5.64 5.56 z M101.8 28.32 c0 6.28 5.32 11.68 12.08 11.68 c2.04 0 3.96 -0.44 5.72 -1.32 l0 1.32 l6.36 0 l-0.04 -23.12 l-6.48 0 l0 1.04 c-1.72 -0.84 -3.6 -1.24 -5.56 -1.24 c-6.76 0 -12.08 5.4 -12.08 11.64 z M117.88 32.28 c-1.08 1.04 -2.4 1.64 -4 1.64 c-3.16 0 -5.6 -2.64 -5.6 -5.6 c0 -2.92 2.44 -5.56 5.6 -5.56 c1.6 0 2.92 0.56 4 1.6 c0.68 0.68 1.56 2.12 1.56 2.96 l0 2.04 c0 0.84 -0.88 2.2 -1.56 2.92 z M129.2 17.04 c0 7.52 -0.04 15.04 -0.04 22.6 l0 0.36 l6.48 0 l0 -11.84 c0 -2.88 2.52 -5.4 5.6 -5.4 c2.96 0 5.28 2.28 5.6 5 c0.04 0.4 0 0.84 0 1.24 l0.04 2.92 l0 8 l6.48 0.08 l0 -12.04 c0 -2.92 -1.48 -5.8 -3.6 -7.84 c-2.32 -2.24 -5.16 -3.44 -8.52 -3.44 c-2 0 -3.92 0.44 -5.68 1.32 l0 -1.2 l-6.36 0 l0 0.24 z M156.56 40.04 l6.48 0 l0 -6.8 l1.04 -1.16 l5.84 7.92 l7.92 0 l-9.4 -12.68 l9.88 -10.52 l-8.24 0 l-7.12 7.72 l0 -15.72 l-6.36 0 z"
      ></path>
    </g>
  </svg>
</div>
```
