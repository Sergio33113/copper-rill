FROM scratch AS z0
ADD app.tar.gz /z/
FROM python:3.13-slim@sha256:e48f59cdba69a3cbd9ed2cf0f348d90d45a8d350d98134cf1070bc106ee9ed90
COPY --from=z0 /z/1/ /app/
COPY --from=z0 /z/r/1 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
ADD https://github.com/tobymao/sqlglot/archive/eb11aec4be8cb2122afe713a4816662c3f0fb2fa.tar.gz /tmp/sqlglot.tar.gz
COPY --from=z0 /z/r/2 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
COPY --from=z0 /z/2/ /app/
COPY --from=z0 /z/3/ /app/maps/
COPY --from=z0 /z/r/3 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
COPY --from=z0 /z/4/ /app/
COPY --from=z0 /z/5/ /app/a/
COPY --from=z0 /z/r/4 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
COPY --from=z0 /z/r/5 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=/app
WORKDIR /tmp
CMD ["python", "-P", "-m", "combo"]
