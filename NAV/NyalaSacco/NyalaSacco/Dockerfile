#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["NAV/NyalaSacco/NyalaSacco/NyalaSacco.csproj", "NAV/NyalaSacco/NyalaSacco/"]
RUN dotnet restore "NAV/NyalaSacco/NyalaSacco/NyalaSacco.csproj"
COPY . .
WORKDIR "/src/NAV/NyalaSacco/NyalaSacco"
RUN dotnet build "NyalaSacco.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NyalaSacco.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NyalaSacco.dll"]